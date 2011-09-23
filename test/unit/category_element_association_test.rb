require 'test_helper'

class CategoryElementAssociationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Info
# Schema version: 20110923200413
#
# Table name: category_element_associations
#
#  id           :integer(4)      not null, primary key
#  category_id  :integer(4)      not null
#  element_id   :integer(4)      not null
#  root_id      :integer(4)      not null
#  label        :string(255)
#  prefix_label :boolean(1)      not null, default(TRUE)
#  show_parent  :boolean(1)      not null
#  show_root    :boolean(1)      not null, default(TRUE)
#  created_at   :datetime
#  updated_at   :datetime