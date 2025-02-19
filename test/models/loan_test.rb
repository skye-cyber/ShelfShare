require "test_helper"

class LoanTest < ActiveSupport::TestCase
  test "should not save loan without borrower_name" do
    loan = Loan.new
    assert_not loan.save, "Loan saved without a borrower name"
  end

  test "should save loan with valid attributes" do
    book = books(:one)
    loan = book.loans.new(borrower_name: "Mwikya", borrowed_on: Time.current)
    assert loan.save, "Loan did not save with valid attributes: #{loan.errors.full_messages}"
  end
end
