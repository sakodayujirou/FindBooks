class VideoBook < ApplicationRecord
  belongs_to :video
  belongs_to :book
  belongs_to :video
  belongs_to :book
end
