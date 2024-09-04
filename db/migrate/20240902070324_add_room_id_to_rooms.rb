class AddRoomIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :Room_id, :integer
  end
end
