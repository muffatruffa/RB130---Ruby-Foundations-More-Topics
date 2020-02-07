# Write a method called none? that behaves similarly for Arrays.
# It should take an Array as an argument, and a block.
# It should return true if the block returns false for all of the element values.
# Otherwise, it should return false.
# Your method should stop processing elements of the Array as soon as the block returns true.
# If the Array is empty, none? should return true, regardless of how the block is defined.

def any?(array)
  array.each do |el|
    return true if yield(el)
  end

  false
end

def none?(collection)
  not any?(collection) { |el| yield(el)}
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true