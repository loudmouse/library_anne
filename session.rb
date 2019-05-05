require_relative "./reading_list"
require_relative "./books"
require_relative "./book_status"
require_relative "./library_branches"
require 'pry'

class Session
  attr_accessor :reading_list, :books, :book_status, :library_branches
  def initialize
    @reading_list = ReadingList.new.get_list
    @books = Books.new(reading_list)
    @book_status = BookStatus.new
    @library_branches = LibraryBranches.new
  end

  def start
    setup
  end

  private

  def setup
    select_book
    select_branch
    is_available?
  end

  def select_book
    books.select_book
  end

  def select_branch
    library_branches.select_branch
  end

  def isbn
    books.isbn
  end

  def branch
    library_branches.branch
  end

  def is_available?
    book_status.availability(isbn, branch)
  end
end
