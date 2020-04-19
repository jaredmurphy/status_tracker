class User < ApplicationRecord
  validates :username, :email, presence: true, uniqueness: true

  has_many :follower_requests, class_name: "FollowedUser", foreign_key: :following_id, dependent: :destroy
  has_many :following_requests, class_name: "FollowedUser", foreign_key: :follower_id, dependent: :destroy

  has_many :followers, -> { FollowedUser.accepted }, through: :follower_requests
  has_many :following, -> { FollowedUser.accepted }, through: :following_requests

  has_many :statuses
end
