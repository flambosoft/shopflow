class AddOptionIdToVariantValue < ActiveRecord::Migration[7.0]
  def change
    add_column :variant_values, :option_id, :integer
  end
end
