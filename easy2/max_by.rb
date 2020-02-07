# def max_by(ar)
#   return nil if ar.empty?

#   max = ar.first
#   max_evaluated = yield(ar.first)

#   ar[1..-1].each do |el|
#     current_evaluated = yield(el)
#     if current_evaluated > max_evaluated
#       max = el
#       max_evaluated = current_evaluated
#     end
#   end
#   max
# end

def max_by(ar)
  return nil if ar.empty?

  store_max = ->(max, ev_max) do
    
    partial_max = ->(max, ev_max, current) do
       ev_current = yield(current)
      if ev_current > ev_max
        max = current
        ev_max = ev_current
      end
      [max, -> { partial_max.curry[max][ev_max] }]
    end
    
    [max, -> { partial_max.curry[max][ev_max] }]
  end

  get_max = store_max.(ar[0], yield(ar[0]))
  ar[1..-1].each do |el|
    # execute the anonymous lambda stored in the array returned by
    # store_max and partial_max, this call will return partial_max curried
    get_max = get_max[1].call
    # execute partial_max curried, passing in last argument,
    # this will force the execution of the curried lambda
    get_max = get_max[el]
    # We could have written this in one line:
    # get_max = get_max[1].()[el]
  end
  get_max.first
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
