class AddColToCategory < ActiveRecord::Migration
  def self.up
      add_column :categories, :cat_file_name,:string
      add_column :categories, :cat_content_type, :string
      add_column :categories, :cat_file_size,:integer
      add_column :categories, :cat_updated_at,:datetime
  end

  def self.down
      remove_column :categories, :cat_file_name
      remove_column :categories, :cat_content_type
      remove_column :categories, :cat_file_size
      remove_column :categories, :cat_updated_at
  end
end

