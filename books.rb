require 'pry'
require_relative 'reading_list'
require_relative 'book'

# Contains info for each book
class Books
  attr_reader :books
  attr_accessor :isbn

  def initialize(reading_list)
    @books = get_books(reading_list)
  end

  def select_book
    puts "Enter number of book you'd like to check availability."
    display_books
    book_selection = gets.chomp.to_i
    @isbn = book_selector(book_selection)
  end

  private

  def display_books
    @numbered_books = books.each_with_index {|(book, _), index| puts "#{index}: #{book.title}" }
  end

  def book_selector(book_selection)
    @numbered_books[book_selection].isbn
  end

  def get_books(reading_list)
    reading_list.books.collect do |object|
      Book.new(object[:book][:title], object[:book][:isbn])
    end
  end
end
