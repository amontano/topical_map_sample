require 'test_helper'

class ElementTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Info
# Schema version: 20110827201144
#
# Table name: elements
#
#  id                 :integer(4)      not null, primary key
#  category_id        :integer(4)
#  second_category_id :integer(4)
#  show_parent        :boolean(1)      not null
#  show_root          :boolean(1)      not null, default(TRUE)
#  title              :string(255)
#  created_at         :datetime
#  updated_at         :datetime