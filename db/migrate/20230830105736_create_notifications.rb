class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.integer :notifiable_id
      t.string :notifiable_type
      t.datetime :read_at
      t.belongs_to :admin, foreign_key: true, index:true

      t.timestamps
    end
  end
end
