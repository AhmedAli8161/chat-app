class CreateRoomMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :room_messages do |t|
      t.integer :room_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
