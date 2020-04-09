class Status < ApplicationRecord
  belongs_to :user

  validates :user, :text, presence: true
  validates :do_not_disturb, default: false
end
