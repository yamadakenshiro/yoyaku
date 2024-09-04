class RenameRoomIdColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :Room_id, :room_id
  end
end
