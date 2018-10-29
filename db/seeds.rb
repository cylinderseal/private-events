User.create!(username: "Root User", email: "root_user@example.com", 
             password: "123456", password_confirmation: "123456")
puts "Created Root User"

50.times do |n|
  User.create!(username: Faker::Name.name, 
               email: Faker::Name.name.split(" ")[0] + "#{n}@example.com",
               password: "123456", password_confirmation: "123456")
end
puts "#{User.count} users created."

50.times do |n|
  Event.create!(title: "Event #{n + 1}", description: Faker::Lorem.paragraph(10), 
                date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
                location: Faker::Address.full_address, creator_id: rand(1..50),
                tag_list: [Faker::Color.color_name, Faker::Color.color_name, Faker::Color.color_name] )
end
puts "#{Event.count} events created."

100.times do |n|
  random_number = rand(1..50)
  user = User.find(random_number)
  event = Event.find(random_number)
  user.attended_events << event
  puts "#{user.username} is attending #{event.title}"
end