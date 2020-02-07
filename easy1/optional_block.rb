# Write a method that takes an optional block. 
# If the block is specified, the method should execute it,
# and return the value returned by the block. If no block is specified,
# the method should simply return the String 'Does not compute.'

def compute
  return yield if block_given?

  'Does not compute.'
end

puts compute { 5 + 3 } == 8
puts compute { 'a' + 'b' } == 'ab'
puts compute == 'Does not compute.'

# Further Exploration

# Modify the compute method so it takes a single argument
# and yields that argument to the block.
# Provide at least 3 examples of calling this new version of compute,
# including a no-block call.

def compute_f_e(yielded, &block)
  return block.(yielded) if block_given?

    do_not_exist.nil? NameError
  rescue 

  block.nil?
end

p compute_f_e("5 + 3 =") { |what_ever| "#{what_ever} #{5 + 3}" } == "5 + 3 = 8" # true
p compute_f_e("I have size", &:size)== "I have size".size # true
p compute_f_e("what ever") == true # true