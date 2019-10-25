class Outing < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  #has_many_attached :cover_images
  #has_many :restaurant_foods
  has_one_attached :outing_picture

  has_many :food_orders

  validates :description, presence: true
  validates :meeting_time, presence: true

  scope(:search, -> (query) {where("description ILIKE ?", "%#{query}%")})

  


end
