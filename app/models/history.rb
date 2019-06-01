class History < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :profits
end
