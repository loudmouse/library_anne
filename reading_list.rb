require 'goodreads'

class ReadingList
  attr_reader :connection
  def initialize
    @connection = Goodreads::Client.new(
      api_key: ENV['GOODREADS_API_KEY'],
      api_secret: ENV['GOODREADS_API_SECRET']
    )
  end

  def get_list(user_id = 39558034, shelf_name = 'to-read', books_per_page = 200)
    connection.shelf(user_id, shelf_name, per_page: books_per_page)
  end
end
