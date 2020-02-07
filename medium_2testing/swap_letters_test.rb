require 'minitest/autorun'
require_relative 'swap_letters'

class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample.txt')
    @swaped = <<-TEXT.chomp
Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
et verius meuris, et pheretre mi.
TEXT
  end

  def test_swap
    text = Text.new(@file.read)
    assert_equal @swaped, text.swap('a', 'e')
  end

  def test_word_count
    text = Text.new(@file.read)
    assert_equal 72, text.word_count
  end


  def teardown
    @file.close
    puts "File Closed: #{@file.closed?}"
  end
end