class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true

  has_many :follower_requests, class_name: "FollowedUser", foreign_key: :following_id, dependent: :destroy
  has_many :following_requests, class_name: "FollowedUser", foreign_key: :follower_id, dependent: :destroy

  has_many :followers, -> { FollowedUser.accepted }, through: :follower_requests
  has_many :following, -> { FollowedUser.accepted }, through: :following_requests

  has_many :statuses
end
