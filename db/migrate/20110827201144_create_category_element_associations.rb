class CreateCategoryElementAssociations < ActiveRecord::Migration
  def self.up
    create_table :category_element_associations do |t|
      t.integer :category_id, :null => false
      t.integer :element_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :category_element_associations
  end
end
