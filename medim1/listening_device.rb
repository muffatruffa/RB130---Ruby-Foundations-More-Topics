require 'minitest/autorun'
#  It lets us record something that is said and store it for later use.
#  In general, this is how the device should be used:
# Listen for something, and if anything is said, record it for later use.
# If nothing is said, then do not record anything.

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def play
    puts @recordings.last
  end
end


class TestDevice < Minitest::Test
  def setup
    @listener = Device.new
  end

  def test_listen_can_record
    @listener.listen { "Hello World!" }
    @listener.listen
    assert_output("Hello World!\n") { @listener.play }
    @listener.listen {"Welcome"}
    assert_output("Welcome\n") { @listener.play }
  end
end