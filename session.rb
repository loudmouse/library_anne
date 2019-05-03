require_relative "./reading_list"
require_relative "./books"
require_relative "./book_search"
require_relative "./library_branches"
require 'pry'

class Session
  attr_accessor :reading_list, :books, :book_search, :library_branches
  def initialize
    @reading_list = ReadingList.new.get_list
    @books = Books.new(reading_list)
    @book_search = BookSearch.new
    @library_branches = LibraryBranches.new
  end

  def setup
    select_book
    select_branch
    is_available?
  end

  private

  def select_book
    puts "Enter number of book you'd like to check availability."
    books.display_books
    book_selection = gets.chomp.to_i
    @isbn = books.book_selector(book_selection)
  end

  def select_branch
    puts "Enter a number to select your branch."
    library_branches.display_branches
    branch_selection = gets.chomp.to_i
    @branch = library_branches.branch_selector(branch_selection)
  end

  def is_available?
    book_search.availability(@isbn, @branch)
  end

end
