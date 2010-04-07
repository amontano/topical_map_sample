class Element < ActiveRecord::Base
  belongs_to :category
  belongs_to :second_category, :class_name => 'Category'
end
