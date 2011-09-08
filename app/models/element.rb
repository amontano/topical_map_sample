class Element < ActiveRecord::Base
  validates_presence_of :title
  
  belongs_to :category
  belongs_to :second_category, :class_name => 'Category'
  has_many :category_element_associations, :dependent => :destroy
end

# == Schema Info
# Schema version: 20110905224343
#
# Table name: elements
#
#  id                 :integer(4)      not null, primary key
#  category_id        :integer(4)
#  second_category_id :integer(4)
#  title              :string(255)
#  created_at         :datetime
#  updated_at         :datetime