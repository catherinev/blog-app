# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.create(name: 'catherine', email: 'hello@gmail.com', password: 'password')
User.create(name: 'bo', email: 'boo@gmail.com', password: 'password')

20.times do 
	Article.create(title: Faker::Lorem.words(rand(2..10)).join(" "), text: Faker::Lorem.paragraphs(rand(2..4)).join(" "))
end

1.upto(12) do |i|
	User.find(1).articles << Article.find(i)
end

13.upto(20) do |i|
	User.find(2).articles << Article.find(i)
end

15.times do
	Article.find(rand(20) + 1).tags << Tag.find_or_create_by(label: 'batman')
end

10.times do
	Article.find(rand(20) + 1).tags << Tag.find_or_create_by(label: 'dumbledore')
end

10.times do
	Article.find(rand(20) + 1).tags << Tag.find_or_create_by(label: 'honeybadger')
end