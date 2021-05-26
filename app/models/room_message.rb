class RoomMessage < ApplicationRecord
  belongs_to :room, optional: true
  #belongs_to :user
  belongs_to :sender, class_name: "User", foreign_key:"user_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id", optional: true
  validates :message, presence: true, length: {minimum: 1, maximum:150 }
  # scope :chat_messages, -> { where("room_id = nil") }
  # scope :chat_messages, -> { where("room_id = nil") }
  after_commit :broadcast_message, on: :create

  def as_json(options)
    # byebug
    super(options).merge(user_avatar_url: sender.gravatar_url)
  end


  def broadcast_message
    RoomChannel.broadcast_to self.room, { html: html(self, self.sender), message: self }
  end

  def html(message, user)
    ApplicationController.render(
      partial: 'room_messages/message',
      locals: { room_message: message, user: user }
    )
  end
end
