require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(10)
  end

  def test_prompt_for_payment_success
    capture_io do
      orig_stdin = $stdin
      $stdin = StringIO.new("10\n")
      @transaction.prompt_for_payment
      $stdin = orig_stdin
    end
    assert_equal 10, @transaction.amount_paid
  end

  def test_prompt_for_payment_fails_until_valid_payment
    capture_io do
      orig_stdin = $stdin
      $stdin = StringIO.new("-5\n0\n10\n")
      @transaction.prompt_for_payment
      $stdin = orig_stdin
    end
    assert_equal 10, @transaction.amount_paid
  end

  def test_prompt_for_payment_fails_until_sufficient_payment
    capture_io do
      orig_stdin = $stdin
      $stdin = StringIO.new("3\n20\n")
      @transaction.prompt_for_payment
      $stdin = orig_stdin
    end
    assert_equal 20, @transaction.amount_paid
  end
end