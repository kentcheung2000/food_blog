# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Outing.delete_all
RestaurantFood.delete_all
Restaurant.delete_all
FoodOrder.delete_all

User.delete_all

PASSWORD = "123"
NUM_OF_USERS = 20
NUM_OF_RESTAURANT = 20
NUM_OF_OUTING = 20

super_user = User.create(
  first_name: "Kent",
  last_name: "Cheung",
  email: "kentcheung2000@yahoo.com",
  password: PASSWORD,
  is_admin: true,
  address: "600-628 6th Ave, New Westminster, BC V3M 6Z1"
)

NUM_OF_USERS.times do |num|
  full_name = Faker::TvShows::SiliconValley.character.split(' ')
  first_name = full_name[0]
  last_name = full_name[1]
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}-#{num}@codecore.ca",
    password: 'codecore',
    latitude: Faker::Number.decimal(l_digits: 3, r_digits: 3),
    longitude: Faker::Number.decimal(l_digits: 3, r_digits: 3),
    is_admin: false
  )
end

users = User.all

NUM_OF_RESTAURANT.times do
  created_at = Faker::Date.between(from: 100.days.ago, to: Date.today)
  r = Restaurant.create({
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    latitude: Faker::Number.decimal(l_digits: 3, r_digits: 3),
    longitude: Faker::Number.decimal(l_digits: 3, r_digits: 3)
  })

  if r.valid?
    rand(0..10).times.each do
      RestaurantFood.create(
        name: Faker::Food.dish,
        description: Faker::Food.description,
        price: Faker::Number.decimal(l_digits: 2),
        restaurant: r
      )
    end
  end
end

restaurants = Restaurant.all


NUM_OF_OUTING.times do
  created_at = Faker::Date.between(from: 30.days.ago, to: Date.today)
  restaurant = restaurants.sample
  o = Outing.create({
    description: Faker::ChuckNorris.fact,
    meeting_time: Faker::Time.backward(days: 23, period: :morning),
    meeting_date: Faker::Date.between(from: 23.days.ago, to: Date.today),
    total: Faker::Number.decimal(l_digits: 3, r_digits: 3),
    user: users.sample,
    restaurant: restaurant

  })

  if o.valid?
    rand(0..15).times.each do
      FoodOrder.create(
        description: Faker::ChuckNorris.fact,
        outing: o,
        restaurant_food: restaurant.restaurant_foods.sample
      )
    end
  end
end

 

outings = Outing.all

puts "Created #{User.count} users"
puts "Created #{Restaurant.count} restaurants"
puts "Created #{Outing.count} outings"
puts "Created #{FoodOrder.count} food orders"
puts "Login as admin with #{super_user.email} and password of '#{PASSWORD}'!"

