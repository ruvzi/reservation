# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#


10.times do
  ::Restaurant.create(name: Faker::Restaurant.name, description: Faker::Restaurant.description)
end

15.times do
  User.create(name: Faker::Name.name, phone: Faker::PhoneNumber.phone_number)
end

::Restaurant.find_each do |restaurant|
  (5..10).to_a.shuffle.first.times { |n| restaurant.tables.create(number: "Столик №#{n + 1}") }
end
