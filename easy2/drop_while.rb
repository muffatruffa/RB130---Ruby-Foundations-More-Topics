# Write a method called drop_while that behaves similarly for Arrays.
# It should take an Array as an argument, and a block.
# It should return all the elements of the Array,
# except those elements at the beginning of the Array that produce a truthy value
# when passed to the block.

# If the Array is empty, or if the block returns a truthy value for every element,
# drop_while should return an empty Array.

# def drop_while(collection)
#   collection.each_index do |index|
#     keep = collection.size - index
#     return collection[index, keep] unless yield(collection[index])
#   end
#   []
# end

def drop_while(collection)
  drop_while_rec = -> (collection, kept) do
    if collection.empty?
      kept
    else
      if yield(collection[0])
        drop_while_rec.(collection[1..-1], [])
      else
        collection
      end
    end
  end
  drop_while_rec.(collection, [])
end


p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
