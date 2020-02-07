require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash = CashRegister.new(5)
  end

  def test_total_money_is_set_to_five
    assert_equal 5, @cash.total_money
  end

  def test_accept_money_increment_total_money
    Transaction.new("dummy").stub(:amount_paid, 10) do |transaction|
      @cash.accept_money(transaction)
    end
    assert_equal 15, @cash.total_money
  end

  def test_change_subtract_10_from_amount_20
    Transaction.new("dummy").stub(:amount_paid, 20) do |transaction|
      transaction.stub(:item_cost, 10) do
        assert_equal 10, @cash.change(transaction)
      end
    end
  end

  def test_change_do_not_validate_and_returns_negative
    Transaction.new("dummy").stub(:amount_paid, 10) do |transaction|
      transaction.stub(:item_cost, 20) do
        assert_equal -10, @cash.change(transaction)
      end
    end
  end

  def test_change_returns_zero
    Transaction.new("dummy").stub(:amount_paid, 10) do |transaction|
      transaction.stub(:item_cost, 10) do
        assert_equal 0, @cash.change(transaction)
      end
    end
  end

  def test_give_receipt_output_item_cost
    Transaction.new("dummy").stub(:item_cost, 10) do |transaction|
      assert_output("You've paid $10.\n") { @cash.give_receipt(transaction) }
    end
  end
end