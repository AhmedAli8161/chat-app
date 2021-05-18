class RoomMessagesController < ApplicationController
  before_action :load_entities

  def create

    @room_message = current_user.room_messages.new(params.require(:room_message).permit(:room_id, :message))
    if @room_message.save
      RoomChannel.broadcast_to @room, @room_message
    end

  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
