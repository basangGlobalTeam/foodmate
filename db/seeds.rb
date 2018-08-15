# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
    20.times do 
    User.create(
       email: Faker::Internet.free_email,
       password: "123456",
       password_confirmation: "123456",
       intro: Faker::HowIMetYourMother.quote,
       name: Faker::Name.name_with_middle,
       sex: Faker::Gender.binary_type,
       date_of_birth: Faker::Date.birthday(12, 65) 
    ) 
    end
    
    60.times do 
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
    
    80.times do 
    Follow.create(
       user_id: Faker::Number.between(1, 20),
       user_follow_id: Faker::Number.between(1, 20),
    ) 
    end