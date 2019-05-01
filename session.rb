require_relative "./user"
require_relative "./reading_list"
require_relative "./books"
require_relative "./library"
require 'pry'

class Session
  attr_accessor :reading_list, :user, :books, :selection, :library_session
  def initialize
    @reading_list = ReadingList.new.get_reading_list
    @books = Books.new(reading_list)
    @user = User.new
    @selection = nil
    @library_session = Library.new
  end

  def setup
    # list_book_options
    # display_books
    # select_isbn
    select_book
    select_branch
    is_available?
  end

  private

  def list_isbns
    books.isbns.each { |isbn| puts isbn }
  end

  def display_books
    books.display_books
  end

  def list_book_options
    books.titles_with_isbns
  end

  def display_titles
    books.display_titles
  end

  def display_isbns
    books.display_isbns
  end

  # def select_isbn
  #   puts "Select an ISBN."
  #   @isbn = gets.chomp.to_i
  # end

  def select_branch
    puts "Enter a number to select your branch."
    library_session.display_branches
    branch_selection = gets.chomp.to_i
    @branch = library_session.branch_selector(branch_selection)
  end

  def select_book
    puts "Enter number of book you'd like to check availability."
    books.display_books
    book_selection = gets.chomp.to_i
    @isbn = books.book_selector(book_selection)
  end

  ## remove
  def select_book_old
    puts "Enter number of book you'd like to check availability."
    selection = gets.chomp
  end

  def is_available?
    library_session.availability(@isbn, @branch)
  end

end
