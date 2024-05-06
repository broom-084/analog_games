# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by!(email: "123456@example.com") do |admin|
  admin.password = "123456"
  admin.password_confirmation = '123456'
end

User.find_or_create_by!(email: "123456@example.com") do |user|
  user.password = "123456"
  user.password_confirmation = '123456'
  user.name = "123456"
  user.introduction = "introduction"
end