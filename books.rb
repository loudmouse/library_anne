require 'pry'
require_relative 'reading_list'

# Contains info for each book
class Books
  attr_reader :books
  attr_accessor :isbn

  def initialize(reading_list)
    @books = parse_list(reading_list)
  end

  def select_book
    puts "Enter number of book you'd like to check availability."
    display_books
    book_selection = gets.chomp.to_i
    @isbn = book_selector(book_selection)
  end

  private

  def display_books
    @books_with_ids = books.each_with_index {|(book, _), index| puts "#{index}: #{book[:title]}" }
  end

  def book_selector(book_selection)
    @books_with_ids[book_selection][:isbn]
  end

  Book = Struct.new(:title, :isbn)
  def parse_list(reading_list)
    reading_list.books.collect do |object|
      Book.new(object[:book][:title], object[:book][:isbn])
    end
  end
end
