class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy
  # has_many :room_users
  # has_many :users, through: :room_users
  belongs_to :user
  # belongs_to :creator, class_name: "User", foreign_key: "user_id"
end
