class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader
  validates :body, presence: true, unless: :image?
  validates :group_id, presence: true
  validates :user_id, presence: true
end
