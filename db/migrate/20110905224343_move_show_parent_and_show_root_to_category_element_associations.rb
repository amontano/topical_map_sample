class MoveShowParentAndShowRootToCategoryElementAssociations < ActiveRecord::Migration
  def self.up
    change_table :elements do |t|
      t.remove :show_parent
      t.remove :show_root
    end
    change_table :category_element_associations do |t|
      t.boolean :show_parent, :default => false, :null => false
      t.boolean :show_root, :default => true, :null => false
    end
  end

  def self.down
    change_table :category_element_associations do |t|
      t.remove :show_parent
      t.remove :show_root
    end
    change_table :elements do |t|
      t.boolean :show_parent, :default => false, :null => false
      t.boolean :show_root, :default => true, :null => false
    end
  end
end
