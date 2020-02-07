# Some note: in this solution I found interesting
# the use of NilClass#to_s and String#chr.
# The first return an empty string the latter the first character
# string of self, both were very handy.
# They allowed the use polymorhpism and duck typing.


def decrypt_letter(letter)
  decripted_ord = letter

  case letter
  when /[a-z]/
    decripted_ord = (letter.ord - 'a'.ord + 13) % 26 + 'a'.ord
  when /[A-Z]/
    decripted_ord = (letter.ord - 'A'.ord + 13) % 26 + 'A'.ord
  end

  decripted_ord.chr
end

def decrypt_line(line)
  line.gsub(/([a-z])|([A-Z])/) do |s|
    decrypt_letter(s)
  end
end

def print_encrypted_file(file_name)
  open(file_name) do |file| 
    file.each do |line| 
      puts decrypt_line(line)
    end
  end
end

# Suppose you saved the name list in the file names.txt
print_encrypted_file('names.txt')