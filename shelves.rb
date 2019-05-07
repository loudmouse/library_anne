require 'httparty'
require 'pry'

# this will get the list of book shelves for a user given his user_id
class Shelves
  attr_reader :shelves, :numbered_shelves, :shelf
  def initialize
    # need to get this programmatically
    url = "https://www.goodreads.com/shelf/list.xml?key=#{ENV['GOODREADS_API_KEY']}&user_id=#{ENV['GOODREADS_USER_ID']}"
    response = HTTParty.get(url)
    @shelves = response["GoodreadsResponse"]["shelves"]["user_shelf"]
  end

  def select_shelf
    puts "Enter number of shelf you'd like to browse."
    display_shelves
    shelf_selection = gets.chomp.to_i
    @shelf = shelf_selector(shelf_selection)
  end

  private

  def display_shelves
    @numbered_shelves = shelves.each_with_index {|(shelf), index| puts "#{index}: #{shelf['name']}" }
  end

  def shelf_selector(shelf_selection)
    numbered_shelves[shelf_selection]['name']
  end
end
