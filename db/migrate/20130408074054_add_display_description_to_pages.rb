class AddDisplayDescriptionToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :display_description, :boolean, :default => true
  end

  def self.down
    remove_column
  end
end
