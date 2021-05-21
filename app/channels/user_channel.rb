class UserChannel < ApplicationCable::Channel
  def subscribed
    user = User.find params[:user]
    stream_for user

    # or
    # byebug
    # stream_from "user_messages_sender_#{params[:user]}_receiver"
  end
end
