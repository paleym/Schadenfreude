# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(firstName: "Shannon", lastName: "Moore", email: "test@colorado.edu", password: "password123", password_confirmation: "password123", birthday: "2013-12-2", remember_token: "EQqnEJqt_b19H9pBZe5wkk")
