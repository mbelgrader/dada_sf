# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
                  time: time)
end

50.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.safe_email
  guests = Faker::Number.between(8, 40)
  date = Faker::Date.forward(23)
  phone = Faker::PhoneNumber.cell_phone
  time = Faker::Time.backward(14, :evening)
  size = Faker::Company.profession
  info = Faker::Company.buzzword
  Party.create!(name: name,
                  email: email,
                  phone: phone,
                  guests: 10,
                  date: date,
                  time: time,
                  size: size,
                  info: info)
end

10.times do |n|
  name = Faker::Name.name
  date = Faker::Date.forward(23)
  time = Faker::Time.backward(14, :evening)
  Event.create!(name: "Kareoke",
                  date: date,
                  time: time,
                  info: "Come join us for Kareoke Thursdays!")
end

10.times do |n|
  name = Faker::Name.name
  date = Faker::Date.forward(23)
  time = Faker::Time.backward(14, :evening)
  Event.create!(name: "Stalin 7:00pm",
                  date: date,
                  time: time,
                  info: "Live Event: Bay Area metal band performing their hits")
end

10.times do |n|
  name = Faker::Name.name
  date = Faker::Date.forward(23)
  time = Faker::Time.backward(14, :evening)
  Event.create!(name: "90s Night",
                  date: date,
                  time: time,
                  info: "Get ready to jam out to classic 90s all day")
end

10.times do |n|
  name = Faker::Name.name
  date = Faker::Date.forward(23)
  time = Faker::Time.backward(14, :evening)
  Event.create!(name: "80s Night",
                  date: date,
                  time: time,
                  info: "Grab your windbreakers..its hammertime")
end

2.times do |n|
  name = Faker::Name.name
  date = Faker::Date.forward(23)
  time = Faker::Time.backward(14, :evening)
  Event.create!(name: "Electro House Party",
                  date: date,
                  time: time,
                  info: "We'll be spinning the hottest beats of the bay area. You don't want to miss this!")
end

2.times do |n|
  name = Faker::Name.name
  date = Faker::Date.forward(23)
  time = Faker::Time.backward(14, :evening)
  Event.create!(name: "Nick Flatt Showcase",
                  date: date,
                  time: time,
                  info: "Meet emerging artist Nick Flatt. Free snacks!")
end
