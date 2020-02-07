factorial = Enumerator.new do |y|
  last = 0
  fact = 1
  loop do
    y << fact
    last += 1
    fact *= last
  end
end



7.times { puts factorial.next}

factorial.rewind
p factorial.next

factorial.each_with_index do |number, index|
  puts number
  break if index == 6
end

