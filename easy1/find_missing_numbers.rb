# Write a method that takes a sorted array of integers as an argument,
# and returns an array that includes all of the missing integers (in order)
# between the first and last elements of the argument.
# def missing(ordered)
#   missings = []
#   ordered.first.upto(ordered.last).each_with_object(missings) do |number, result|
#     result << number unless ordered.include? number
#   end
# end

# def missing(ordered)
#   ordered.first.upto(ordered.last).to_a - ordered
# end

# def missing(ordered)
#   missing_rec = -> (ordered, result) do
#     if ordered.size == 1
#       result
#     else
#       if ordered[1] == (ordered[0] + 1)
#         missing_rec.(ordered[1..-1], result)
#       else
#         starting_at_missing = [ ordered[0] + 1 ] + ordered[1..-1]
#         missing_rec.( starting_at_missing, result << (ordered[0] + 1) )
#       end 
#     end
#   end
#   missing_rec.(ordered, [])
# end

def missing(ordered)
  first_index = 0
  missings = []
  while first_index < ordered.size  - 1
    second_index = first_index + 1

    first_missing = ordered[first_index] + 1

    until first_missing == ordered[second_index]
      missings << first_missing

      first_missing += 1
    end

    first_index += 1
  end
  missings
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []