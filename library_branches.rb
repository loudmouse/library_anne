require 'mechanize'
require 'pry'

class LibraryBranches
  attr_reader :library_branches

  def initialize
    @library_branches = {
      0 => "West Loop",
      1 => "Wicker Park",
      2 => "Albany Park",
      3 => "Harold Washington Library Center"
    }
  end

  def display_branches
    library_branches.each {|id, branch| puts "#{id}: #{branch}" }
  end

  def branch_selector(branch_selection)
    library_branches[branch_selection]
  end
end
