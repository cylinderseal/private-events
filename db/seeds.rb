al = User.create!(username: "cylinderseal", email: "al@example.com", 
             password: "123456", password_confirmation: "123456")
brad = User.create!(username: "brad", email: "brad@example.com", 
             password: "123456", password_confirmation: "123456")
jack = User.create!(username: "Jack", email: "jack@example.com", 
             password: "123456", password_confirmation: "123456")

description = "ed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit"

event1 = Event.create!(title: "Ruby Meetup", description: description, 
                       date: "Mon, 15 Oct 2018 16:46:58 +0000", creator_id: 1)
event2 = Event.create!(title: "Ripple Party", description: description,
                       date: "Mon, 29 Oct 2020 16:46:58 +0000", creator_id: 2)
event3 = Event.create!(title: "Unbox Workshop", description: description,
                       date: "Tue, 30 Oct 2020 16:46:58 +0000", creator_id: 3)

event1.attendees << al
event2.attendees << al
event2.attendees << jack
event2.attendees << brad
event3.attendees << al
event3.attendees << jack
