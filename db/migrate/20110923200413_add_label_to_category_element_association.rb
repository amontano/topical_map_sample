class AddLabelToCategoryElementAssociation < ActiveRecord::Migration
  def self.up
    change_table :category_element_associations do |t|
      t.string :label, :null => true
      t.boolean :prefix_label, :null => false, :default => true
    end
  end

  def self.down
    change_table :category_element_associations do |t|
      t.remove :label
      t.remove :prefix_label
    end
  end
end
