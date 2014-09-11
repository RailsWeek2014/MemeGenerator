# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Administrator anlegen
admin = User.create!(email: "admin@example.com", password: "12345678", username: "admin", isadmin: true)

# Testuser hinzufügen
admin = User.create!(email: "user1@example.com", password: "12345678", username: "user1", isadmin: false)
admin = User.create!(email: "user2@example.com", password: "12345678", username: "user2", isadmin: false)
admin = User.create!(email: "user3@example.com", password: "12345678", username: "user3", isadmin: false)
admin = User.create!(email: "user4@example.com", password: "12345678", username: "user4", isadmin: false)
admin = User.create!(email: "user5@example.com", password: "12345678", username: "user5", isadmin: false)
admin = User.create!(email: "user6@example.com", password: "12345678", username: "user6", isadmin: false)
admin = User.create!(email: "user7@example.com", password: "12345678", username: "user7", isadmin: false)
admin = User.create!(email: "user8@example.com", password: "12345678", username: "user8", isadmin: false)