class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.string :name
      t.text :description
      t.integer :option_type

      t.timestamps
    end

    add_index :options, :name, unique: true

  end
end
