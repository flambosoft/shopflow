class CreateCharacteristics < ActiveRecord::Migration[7.0]
  def change
    create_table :characteristics do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end
  end
end