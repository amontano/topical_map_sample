class CategoryElementAssociation < ActiveRecord::Base
  validates_presence_of :category_id
  belongs_to :element
  
  def category_stack
    stack = []
    stack << self.label if !label.blank? && self.prefix_label
    stack << self.category.root.title if self.show_root?
    stack << self.category.parent.title if self.show_parent?
    stack << self.category.title
    stack.last << " #{self.label}" if !label.blank? && !self.prefix_label
    stack
  end
  
  def stacked_category
    return category_stack.join(' > ')
  end
  
  def category
    Category.find(self.category_id)
  end
  
  def root
    Category.find(self.root_id)
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