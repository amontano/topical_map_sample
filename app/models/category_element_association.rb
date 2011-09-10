class CategoryElementAssociation < ActiveRecord::Base
  validates_presence_of :category_id
  belongs_to :element
  
  def category_header
    return '' if !self.show_root? && !self.show_parent?
    prefix = []
    prefix << self.category.root.title if self.show_root?
    prefix << self.category.parent.title if self.show_parent?
    return "#{prefix.join(': ')} -"
  end
  
  def category
    Category.find(self.category_id)
  end
  
  def root
    Category.find(self.root_id)
  end
  
  
end

# == Schema Info
# Schema version: 20110905224343
#
# Table name: category_element_associations
#
#  id          :integer(4)      not null, primary key
#  category_id :integer(4)      not null
#  element_id  :integer(4)      not null
#  show_parent :boolean(1)      not null
#  show_root   :boolean(1)      not null, default(TRUE)
#  created_at  :datetime
#  updated_at  :datetime