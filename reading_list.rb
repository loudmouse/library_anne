require 'goodreads'

class ReadingList
  attr_reader :connection
  def initialize
    @connection = Goodreads::Client.new(api_key: "R4T1rmW7K0OfMmud7bCSsA", api_secret: "V4TzTOO029lI7GxDuITUpVE1DWVk63mchsotgDz9so")
  end

  def get_reading_list(user_id = 39558034, shelf_name = 'to-read', books_per_page = 200)
    connection.shelf(user_id, shelf_name, per_page: books_per_page)
  end
end
