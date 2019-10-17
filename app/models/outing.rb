class Outing < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :description, presence: true
  validates :meeting_time, presence: true

  scope(:search, -> (query) {where("description ILIKE ?", "%#{query}%")})

end
