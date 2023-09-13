class RemoveEnabledFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :enabled, :string
  end
end
