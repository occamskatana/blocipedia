# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


15.times do 

	user = User.create!(
		name: Faker::Internet.user_name,
		email: Faker::Internet.email,
		password: "helloworld"
		)

end

users = User.all



		


50.times do 
	wiki = Wiki.create!(

		title: Faker::Hacker.say_something_smart, 
		body: Faker::Hipster.paragraph(5),
		users: users.sample(3)

		)
end


	
wikis = Wiki.all

puts "Seed Finished..."
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"