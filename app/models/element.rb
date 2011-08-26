class Element < ActiveRecord::Base
  belongs_to :category, :class_name => 'Category'
  belongs_to :second_category, :class_name => 'Category'
end
