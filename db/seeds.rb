# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password', user_name: 'test')
admin = User.create(email: 'hunter.braun@gmail.com', password: 'password', password_confirmation: 'password', user_name: 'dewey', admin: true)

past_event = Event.create(title: 'Jumping 101', content: 'Oh yeah! Mario time.', presenter: 'Mario', date: '2014-07-31', user_id: admin.id)
upcoming_event = Event.create(title: 'Ghost Busting 101', content: "Let's take a look at the Poltergust 3000.", presenter: 'Luigi', date: '2015-10-31', user_id: admin.id)
