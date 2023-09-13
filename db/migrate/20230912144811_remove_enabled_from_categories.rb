class RemoveEnabledFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :enabled
    add_column :categories, :enabled, :boolean, default: true
  end
end
