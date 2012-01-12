class Element < ActiveRecord::Base
  validates_presence_of :title
  
  #belongs_to :category
  #belongs_to :second_category, :class_name => 'Category'
  has_many :category_element_associations, :dependent => :destroy
  
  CategoryElementAssociation::FIXED.each_pair{|root_id, associations| has_many associations, :dependent => :destroy, :class_name => 'CategoryElementAssociation', :conditions => {:root_id => root_id} }  
  has_many :not_fixed_associations, :dependent => :destroy, :class_name => 'CategoryElementAssociation', :conditions => ["root_id NOT IN (#{Array.new(CategoryElementAssociation::FIXED.size, '?').join(',')})"] + CategoryElementAssociation::FIXED.keys

  
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