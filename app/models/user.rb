class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  # has_many :created_rooms, class_name: "Room", foreign_key: "user_id", dependent: :destroy
  # has_many :room_users
  has_many :sent_messages, class_name: "RoomMessage", foreign_key:"user_id"
  has_many :received_messages, class_name: "RoomMessage", foreign_key:"receiver_id"
  has_many :rooms
  # has_many :room_messages

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end
end
