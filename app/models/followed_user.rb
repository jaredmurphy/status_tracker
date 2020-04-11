class FollowedUser < ApplicationRecord
  belongs_to :follower, foreign_key: :follower_id, class_name: "User"
  belongs_to :following, foreign_key: :following_id, class_name: "User"

  validates :follower, :following, :status, presence: true

  enum status: %i[pending accepted blocked]
end
