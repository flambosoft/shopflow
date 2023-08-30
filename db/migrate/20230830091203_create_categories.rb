class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, default: "", null:false
      t.string :name_ar
      t.string :description
      t.string :enabled, default:true
      t.string :slug

      t.timestamps
    end
  end
end
