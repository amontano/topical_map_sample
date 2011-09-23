require 'test_helper'

class ElementTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Info
# Schema version: 20110923200413
#
# Table name: elements
#
#  id                 :integer(4)      not null, primary key
#  category_id        :integer(4)
#  second_category_id :integer(4)
#  title              :string(255)
#  created_at         :datetime
#  updated_at         :datetime