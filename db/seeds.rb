# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password', user_name: 'test')

admin = User.create(email: 'hunter.braun@gmail.com', password: 'password', password_confirmation: 'password', user_name: 'dewey', admin: true)

Event.create(id: 1, title: 'Jumping 101', content: 'Oh yeah! Mario time.', presenter: 'Mario', date: '2014-07-31', user_id: admin.id)
