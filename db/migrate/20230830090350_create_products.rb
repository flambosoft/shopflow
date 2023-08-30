class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :short_description
      t.text :description, default: "", null: false
      t.text :ingredients
      t.boolean :enabled, default: true
      t.text :description_ar
      t.text :tags
      t.string :reference
      t.string :original_name
      t.string :slug


      t.timestamps
    end
  end
end
