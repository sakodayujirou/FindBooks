class Video < ApplicationRecord
  mount_uploader :video, VideoUploader
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :books, through: :video_books
  has_many :video_books
  accepts_nested_attributes_for :video_books
end
