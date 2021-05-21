class AddRecieverIdToRoomMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :room_messages,:receiver_id, :integer
  end
end
