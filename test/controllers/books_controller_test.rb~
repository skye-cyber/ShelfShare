require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_path
    assert_response :success
  end

  test "should get new" do
    get new_book_path
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_path, params: { book: { title: "Sample Book", author: "Author Name", description: "Sample Description" } }
    end

    assert_redirected_to book_path(Book.last)
  end

  test "should show book" do
    book = books(:one)
    get book_path(book)
    assert_response :success
  end

  test "should get edit" do
    book = books(:one)
    get edit_book_path(book)
    assert_response :success
  end

  test "should update book" do
    book = books(:one)
    patch book_path(book), params: { book: { title: "Updated Title", author: "Updated Author", description: "Updated Description" } }
    assert_redirected_to book_path(book)
    book.reload
    assert_equal "Updated Title", book.title
  end

  test "should destroy book" do
    book = books(:one)
    assert_difference('Book.count', -1) do
      delete book_path(book)
    end

    assert_redirected_to books_path
  end
end
