class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :name, null:false
      t.string :name_ar

      t.timestamps
    end
  end
end
