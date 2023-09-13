class AddEnabledToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :enabled, :boolean
  end
end
