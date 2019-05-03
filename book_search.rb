require 'mechanize'
require 'pry'

class BookSearch
  attr_reader :page, :form

  def initialize
    agent = Mechanize.new
    @page = agent.get("https://chipublib.bibliocommons.com/search")
  end

  def availability(isbn, branch)
    get_search_form
    fill_and_submit_form(isbn, branch)
  end

  private

  def get_search_form
    @form = page.form_with(:id => 'advanced_search')
  end

  def fill_and_submit_form(isbn, branch)
    form.field_with(:name=>"custom_query").value="identifier:(#{isbn})   branch:\"#{branch}\""
    results = form.submit
    begin
      results.at(".cp-availability-status").text
      book_is_available
    rescue NoMethodError
      book_is_not_available
    end
  end

  def book_is_available
    puts "Your book is available"
  end

  def book_is_not_available
    puts "Your book is NOT available"
  end

end
