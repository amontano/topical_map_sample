class CreateElements < ActiveRecord::Migration
  def self.up
    create_table :elements do |t|
      t.string :title
      t.integer :category_id
      t.integer :second_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :elements
  end
end
