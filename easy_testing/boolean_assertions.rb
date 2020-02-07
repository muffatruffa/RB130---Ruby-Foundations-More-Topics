require 'minitest/autorun'

class NoExperienceError < StandardError; end
class Employ

  
  def hire
    raise NoExperienceError
  end

  def process
    self
  end
end

class BooleanAssertionsTest < Minitest::Test

  def setup
    @value = 7
    @xyz = 'Xyz'
    @list = []
    @employ = Employ.new
    @vlaue = 7
  end


  def test_odd_question_true
    assert @value.odd?, "#{@value} is supposed to be odd"
    assert_equal 'xyz', @xyz.downcase
    @xyz = nil
    assert_nil @xyz
    assert_empty @list
    @list << 'xyz'
    assert_includes @list, 'xyz'
    assert_raises(NoExperienceError) { @employ.hire }

    #assert_instance_of(Numeric, @vlaue)
    assert_kind_of(Numeric, @value)
    list = Employ.new
    assert_same list, list.process
    @list.pop
    refute_includes @list, 'xyz'
  end
end