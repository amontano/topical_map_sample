require 'test_helper'

class CategoryElementAssociationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Info
# Schema version: 20110827201144
#
# Table name: category_element_associations
#
#  id          :integer(4)      not null, primary key
#  category_id :integer(4)      not null
#  element_id  :integer(4)      not null
#  created_at  :datetime
#  updated_at  :datetime