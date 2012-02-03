class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.integer :category_id
      t.string :category_name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
