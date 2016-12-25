# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

200.times do
     user = User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "password",
        password_confirmation: "password",
        age: Faker::Number.digit,
        website: Faker::Internet.domain_name,
        address: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip_code: Faker::Address.zip_code,
        phone_number: Faker::PhoneNumber.phone_number
      )
end
