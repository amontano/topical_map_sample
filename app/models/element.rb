class Element < ActiveRecord::Base
  belongs_to :category
  belongs_to :second_category, :class_name => 'Category'
  has_many :category_element_associations, :dependent => :destroy
  
  def category_header
    return '' if !self.show_root? && !self.show_parent?
    prefix = []
    prefix << self.category.root.title if self.show_root?
    prefix << self.category.parent.title if self.show_parent?
    return "#{prefix.join(': ')} -"
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