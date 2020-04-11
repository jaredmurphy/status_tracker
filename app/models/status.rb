class Status < ApplicationRecord
  validates :user, :text, presence: true
  validates :do_not_disturb, default: false

  belongs_to :user

  scope :current, -> (user) { where(user: user).last }
end
