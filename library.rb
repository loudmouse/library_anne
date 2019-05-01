require 'mechanize'
require 'pry'

# Searches library website
class Library
  attr_reader :page, :form, :branches

  def initialize
    agent = Mechanize.new
    @page = agent.get("https://chipublib.bibliocommons.com/search")
    @branches = {
      0 => "West Loop",
      1 => "Wicker Park",
      2 => "Albany Park",
      3 => "Harold Washington Library Center"
    }
  end

  def availability(isbn, branch)
    get_search_form
    fill_and_submit_form(isbn, branch)
  end

  def display_branches
    branches.each {|id, branch| puts "#{id}: #{branch}" }
  end

  def branch_selector(branch_selection)
    branches[branch_selection]
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
