class LoansController < ApplicationController
    def new
        @book = Book.find(params[:book_id])
        @loan = @book.loans.new
    end

    def create
        @book = Book.find(params[:book_id])
        @loan = @book.loans.new(loan_params)
        @loan.borrowed_on = Time.current
        if @loan.save
            redirect_to book_path(@book), notice: "Book borrowed successfully."
        else
            render :new
        end
    end

    def return
        @loan = Loan.find(params[:id])
        @loan.returned_on = Time.current
        if @loan.save
            redirect_to book_path(@loan.book), notice: "Book returned successfully."
        else
            render :edit
        end
    end

    private

    def loan_params
        params.require(:loan).permit(:borrower_name)
    end
end
