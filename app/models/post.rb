class Post < ActiveRecord::Base
  validates :content, presence: true
  validates :picture, presence: true
  belongs_to :user
  mount_uploader :picture, PictureUploader
end
