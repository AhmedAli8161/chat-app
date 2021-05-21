class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    # byebug
    @rooms = current_user.rooms.all
    @users = User.all
    @user  = User.find(params[:id])
    @room_message = current_user.sent_messages.new
    # @room_messages = current_user.sent_messages#.chat_messages
    @room_messages = RoomMessage.where(receiver_id: [current_user.id, @user.id], user_id: [current_user.id, @user.id] )#.chat_messages

  end
  def createUserMessage

    @room_message = current_user.sent_messages.new(message: params[:"/users/#{params[:id]}"][:message])
    @room_message.receiver = User.find(params[:id])
    if @room_message.save
      receiver =  User.find(params[:id])
      UserChannel.broadcast_to  receiver, { html: html(@room_message, current_user), message: @room_message }
      UserChannel.broadcast_to  current_user, { html: html(@room_message, receiver), message: @room_message }
    else
      redirect_to root_path
    end
  end

  def html(message, user)
    ApplicationController.render(
      partial: 'room_messages/message',
      locals: { room_message: message, user: user }
    )
  end
end
