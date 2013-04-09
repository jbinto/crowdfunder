# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Project.destroy_all

user = User.create!(full_name: "John Doe", email: "johndoe@example.org", password: "abc123")

50.times do |i|
  project = user.projects.create!(title: "Project #{i}", teaser: "Teaser text #{i}", 
    description: "description #{i}", goal: 13000)
end
