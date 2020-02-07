# Write a method called each_with_index that behaves similarly for Arrays.
# It should take an Array as an argument, and a block.
# It should yield each element and an index number to the block.
# each_with_index should return a reference to the original Array.

# def each_with_index(ar)
#   index = 0
#   while index < ar.size
#     yield(ar[index], index)
#     index += 1
#   end
#   ar
# end

def each_with_index(ar)
  e_w_i_rec = -> (yielded, index) do
    if yielded.empty?
      ar
    else
      yield(yielded[0], index)
      e_w_i_rec.(yielded[1..-1], index + 1)
    end
  end
  e_w_i_rec.(ar, 0)
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true
