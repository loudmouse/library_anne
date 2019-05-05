class Book
  attr_reader :title, :isbn

  def initialize(title, isbn)
    @title = title
    @isbn = isbn
  end
end
