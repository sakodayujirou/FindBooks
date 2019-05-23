class Book < ApplicationRecord
  has_many :videos, through: :video_books
  has_many :video_books
end
