# Write a method that does the same thing as Range#step, but does not operate on a range.
# Instead, your method should take 3 arguments: the starting value, the ending value,
# and the step value to be applied to each iteration.
# Your method should also take a block to which it will yield (or call) successive iteration values.

def step(starting, ending, offset)
  counter = starting
  while counter <= ending
    yield (starting)
    if offset == 0
      counter += 1
    else
      counter += offset
    end
    starting += offset
  end
end
# step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10

step(1, 10, 1) { |value| puts "value = #{value}" }
