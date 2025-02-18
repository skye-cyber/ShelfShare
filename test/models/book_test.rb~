require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "book is valid with valid attributes" do
    book = Book.new(title: "Sample Book", author: "Author Name", description: "Sample Description")
    assert book.valid?
  end

  test "book is not valid without title" do
    book = Book.new(author: "Author Name", description: "Sample Description")
    assert_not book.valid?
  end

  test "book is not valid without author" do
    book = Book.new(title: "Sample Book", description: "Sample Description")
    assert_not book.valid?
  end
end
