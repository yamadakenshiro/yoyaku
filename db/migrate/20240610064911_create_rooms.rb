class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :title
      t.text :introduction
      t.integer :price
      t.text :address
      t.string :room_image

      t.timestamps
    end
  end
end
