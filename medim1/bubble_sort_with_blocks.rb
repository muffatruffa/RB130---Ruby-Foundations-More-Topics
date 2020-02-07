require 'benchmark'

def bubble_sort!(array, &block)
  block = proc {|a, b| a < b } unless block_given?
  sorted = false
  until sorted
    sorted = true
    first = 0
    while first <= array.size - 2
      second = first + 1
      unless block.(array[first], array[second])
        array[first], array[second] = array[second], array[first]
        sorted = false
      end
      first += 1
    end
  end
  nil
end

def bubble_sort_by!(array)
  return bubble_sort!(array) unless block_given?
  bubble_sort!(array) { |a, b| yield(a) < yield(b)}
end

def bubble_cached_sort_by!(array)
  return bubble_sort!(array) unless block_given?
  mapped_hash = Hash.new
  array.each { |item| mapped_hash[item] = yield(item)}

  bubble_sort!(array) { |a, b| mapped_hash[a] < mapped_hash[b]}
end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# p array == [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
# p array == [14, 22, 12, 6, 27]

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# array == %w(Kim Pete Tyler alice bonnie rachel sue)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# array == %w(alice bonnie Kim Pete rachel sue Tyler)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort_by!(array) { |value| value.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort_by!(array) do |value|
#   sleep(2)
#   value.downcase
# end
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
puts (Benchmark.realtime do
  bubble_cached_sort_by!(array) do |value|
    sleep(0.5)
    value.downcase
  end
end)

p array == %w(alice bonnie Kim Pete rachel sue Tyler)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
puts (Benchmark.realtime do
  bubble_sort_by!(array) do |value|
    sleep(0.5)
    value.downcase
  end
end)

p array == %w(alice bonnie Kim Pete rachel sue Tyler)