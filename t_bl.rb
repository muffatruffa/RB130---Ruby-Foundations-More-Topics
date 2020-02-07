def execute_block
  yield
end

def give_you_a_parameter(param)
  if block_given?
    execute_block { yield(param) }
  else
    execute_block { puts "You passed in #{param}" }
  end
end

give_you_a_parameter("Hello")

give_you_a_parameter("Hello") { |param| puts "The caller Says: You passed in #{param}" }