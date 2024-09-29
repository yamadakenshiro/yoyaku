class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :room_id
      t.integer :user_id
      t.datetime :start_day
      t.datetime :end_day
      t.integer :number
      t.integer :price

      t.timestamps
    end
  end
end
