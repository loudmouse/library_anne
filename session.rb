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
    display_info
    welcome
    select_branch
    select_book
    is_available?
  end

  def display_info
    puts INFO
  end

  def welcome
    puts "You\'ll pick a library branch and book and Librarian tells you if it's available."
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

INFO = <<Doc
*********************************************************************************************


888 ,e, 888
888  "  888-~88e  888-~\   /~~~8e  888-~\ Y88b  /         /~~~8e  888-~88e 888-~88e  e88~~8e
888 888 888  888b 888          88b 888     Y888/              88b 888  888 888  888 d888  88b
888 888 888  8888 888     e88~-888 888      Y8/          e88~-888 888  888 888  888 8888__888
888 888 888  888P 888    C888  888 888       Y          C888  888 888  888 888  888 Y888    ,
888 888 888-_88"  888     "88_-888 888      /            "88_-888 888  888 888  888  "88___/
                                          _/

                                 - find your next book -

*********************************************************************************************
Doc

end
