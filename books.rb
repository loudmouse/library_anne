require 'pry'
require_relative 'reading_list'

# Contains info for each book
class Books
  attr_reader :books

  def initialize(reading_list)
    @books = parse_list(reading_list)
  end

  def display_books
    @books_with_ids = books.each_with_index {|(book, _), index| puts "#{index}: #{book[:title]}" }
  end

  def book_selector(book_selection)
    @books_with_ids[book_selection][:isbn]
  end

  def titles
    books.collect do |book|
      title(book)
    end
  end

  def display_titles
    titles.each { |title| puts title }
  end

  def title(book)
    book[:title]
  end

  def isbns
    books.collect do |book|
      isbn(book)
    end
  end

  def display_isbns
    isbns.each { |isbn| puts isbn }
  end

  def isbn(book)
    book[:isbn]
  end

  def titles_with_isbns
    books.collect do |book|
      title_with_isbn(book)
    end
  end

  def title_with_isbn(book)
    puts "#{book[:title]} #{book[:isbn]}"
  end

  Book = Struct.new(:title, :isbn)
  def parse_list(reading_list)
    reading_list.books.collect do |object|
      Book.new(object[:book][:title], object[:book][:isbn])
    end
  end
end
