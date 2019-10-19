class Outing < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  has_many_attached :images
  has_many :food_orders 

  validates :description, presence: true
  validates :meeting_time, presence: true

  scope(:search, -> (query) {where("description ILIKE ?", "%#{query}%")})

  


end
