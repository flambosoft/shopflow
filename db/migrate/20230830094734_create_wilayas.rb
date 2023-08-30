class CreateWilayas < ActiveRecord::Migration[7.0]
  def change
    create_table :wilayas do |t|
      t.string :name, null: false
      t.string :name_ar
      t.string :code, null:false

      t.timestamps
    end
  end
end
