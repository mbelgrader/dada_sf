# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "Mike",
             email: "dadabarsf@gmail.com",
             password: "dada",
             password_confirmation: "dada")
             
Contact.create!(name: "Example User",
            email: "example@gmail.com",
            phone: "415-555-5555",
            guests: 10,
            size: "mezzanine",
            info: "Birthday party")

50.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.safe_email
  guests = Faker::Number.between(8, 40)
  date = Faker::Date.forward(23)
  phone = Faker::PhoneNumber.cell_phone
  time = Faker::Time.backward(14, :evening)
  size = Faker::Company.profession
  info = Faker::Company.buzzword
  Contact.create!(name: name,
                  email: email,
                  phone: phone,
                  guests: 10,
                  date: date,
                  time: time,
                  size: size,
                  info: info)
end
