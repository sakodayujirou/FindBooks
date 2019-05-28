class Book < ApplicationRecord
  has_many :videos
  has_many :histories
end
