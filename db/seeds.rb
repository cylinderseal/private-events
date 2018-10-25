al = User.create!(username: "cylinderseal", email: "al@example.com", 
             password: "123456", password_confirmation: "123456")
brad = User.create!(username: "brad", email: "brad@example.com", 
             password: "123456", password_confirmation: "123456")
alex = User.create!(username: "alex", email: "alex@example.com", 
             password: "123456", password_confirmation: "123456")

event1 = Event.create!(title: "Ruby Party", description: "Hello, world", creator_id: 1)
event2 = Event.create!(title: "Ripple Party", description: "Hello, world", creator_id: 2)
event3 = Event.create!(title: "XRP Party", description: "Hello, world", creator_id: 3)

event1.attendees << al
event2.attendees << al
event2.attendees << alex
event2.attendees << brad
event3.attendees << al
event3.attendees << alex
