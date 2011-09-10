class AddRootIdToCategoryElementAssociation < ActiveRecord::Migration
  def self.up
    add_column :category_element_associations, :root_id, :integer
    CategoryElementAssociation.reset_column_information
    CategoryElementAssociation.all.each{ |a| a.update_attribute(:root_id, a.category.root.id) }
    change_column :category_element_associations, :root_id, :integer, :null => false
  end

  def self.down
    remove_column :category_element_associations, :root_id
  end
end