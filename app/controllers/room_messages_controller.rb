class RoomMessagesController < ApplicationController
  include RoomMessagesHelper
  before_action :load_entities, only: [:create]

  def create
    # byebug
    @room_message = current_user.sent_messages.new(params.require(:room_message).permit(:room_id, :message))
    @room_message.save

    if @room_message.room.name == 'chat-bot'
      wit_keys = message_for_bot(@room_message.message)
      User.bot.sent_messages.create(room: @room_message.room, message: "I am bot, I found these keys: #{wit_keys.to_s} ")
    end

    render json: { status: 'SUCCESS', message: 'Wit in Action' }, status: :ok
  end


  protected

  def html(message, user)
    ApplicationController.render(
      partial: 'room_messages/message',
      locals: { room_message: message, user: user }
    )
  end

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end
end
