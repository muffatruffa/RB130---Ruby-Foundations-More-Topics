# Write a method that takes an array as an argument,
# and a block that returns true or false depending
# on the value of the array element passed to it.
# The method should return a count of the number of times the block returns true.


# def count(collection)
#   true_count = 0
#   collection.each { |el| true_count += 1 if yield(el) }
#   true_count
# end

def count(ar)
  count_rec = ->(ar, true_count) do
    if ar.empty?
      true_count
    else
      if yield(ar[0])
        count_rec.(ar[1..-1], true_count + 1)
      else
        count_rec.(ar[1..-1], true_count)
      end
    end
  end
  count_rec.(ar, 0)
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2