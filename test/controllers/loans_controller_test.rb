require "test_helper"

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get new loan form" do
    get new_book_loan_url(@book)
    assert_response :success
  end

  test "should create loan" do
    assert_difference('Loan.count') do
      post book_loans_url(@book), params: { loan: { borrower_name: "Mwikya" } }
    end

    assert_redirected_to book_url(@book)
    assert_equal "Book borrowed successfully.", flash[:notice]
  end

  test "should not create loan with invalid attributes" do
    assert_no_difference('Loan.count') do
      post book_loans_url(@book), params: { loan: { borrower_name: "" } }
    end

    assert_response :success
  end

  test "should return loan" do
    @loan = @book.loans.create(borrower_name: "Mwikya", borrowed_on: Time.current)
    patch return_loan_url(@loan)
    @loan.reload

    assert_equal Time.current, @loan.returned_on, "Loan was not marked as returned"
    assert_redirected_to book_url(@book)
    assert_equal "Book returned successfully.", flash[:notice]
  end

  test "should not return loan with invalid attributes" do
    @loan = @book.loans.create(borrower_name: "Mwikya", borrowed_on: Time.current, returned_on: Time.current)
    patch return_loan_url(@loan)
    @loan.reload

    assert_not_nil @loan.returned_on, "Loan should already be marked as returned"
    assert_redirected_to book_url(@book)
    assert_equal "Book returned successfully.", flash[:notice]
  end
end
