require_relative "./reading_list"

class User
  attr_accessor :name, :zip_code, :library_card_no, :branch_preference, :goodreads_user_id, :goodreads_shelf_name
  def initialize
    @name = nil
    @zip_code = nil
    @library_card_no = nil
    @branch_preference = nil
    @goodreads_user_id = nil
    @goodreads_shelf_name = nil
  end

end
