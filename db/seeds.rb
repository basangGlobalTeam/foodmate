# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
100.times do
  User.create(
    email: Faker::Internet.free_email,
    password: "123456",
    password_confirmation: "123456",
    intro: Faker::HowIMetYourMother.quote,
    name: Faker::Name.name_with_middle,
    sex: Faker::Number.between(0, 1),
    date_of_birth: Faker::Date.birthday(12, 65)
  )
end

200.times do
  Post.create(
    user_id: Faker::Number.between(1, 20),
    content: Faker::Lorem.paragraph_by_chars,
    restaurant: Faker::Restaurant.name
  )
end

70.times do
  Comment.create(
    user_id: Faker::Number.between(1, 20),
    post_id: Faker::Number.between(1, 60),
    content: Faker::OnePiece.quote
  )
end

30.times do
  Food.create(
    name: Faker::Food.dish
  )
end

(1..100).each do |value|
#   following
  15.times do
    id = Faker::Number.between 1, 100
    next if id == value
    Follow.create user_id: value, user_follow_id: id
  end

  15.times do
    id = Faker::Number.between 1, 100
    next if id == value
    Follow.create user_id: id, user_follow_id: value
  end
end
