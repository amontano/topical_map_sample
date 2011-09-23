class Element < ActiveRecord::Base
  validates_presence_of :title
  
  #belongs_to :category
  #belongs_to :second_category, :class_name => 'Category'
  has_many :category_element_associations, :dependent => :destroy
  
  def category
    Category.find(self.category_id)
  end
  
  def second_category
    Category.find(self.second_category_id)
  end
  
  def roots
    self.category_element_associations.all(:select => 'DISTINCT root_id', :order => 'root_id').collect(&:root)
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