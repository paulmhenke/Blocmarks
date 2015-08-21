require 'faker'

member = User.new(name: "Paul Henke", email: "paulmhenke@gmail.com", password: "helloworld")
member.skip_confirmation!
member.save!

member_two = User.new(name: "Another User", email: "phenke@hotmail.com", password: "helloworld")
member_two.skip_confirmation!
member_two.save!

member_three = User.new(name: "Pablo", email: "paulmhenke+2@gmail.com", password: "helloworld")
member_three.skip_confirmation!
member_three.save!

sports = Topic.create!(title: "Sports", user_id: member.id)
sports.save!
business = Topic.create!(title: "Business", user_id: member.id)
business.save!

Bookmark.create!(url: "www.espn.com", topic_id: sports.id, creator_id: member.id)
Bookmark.create!(url: "www.si.com", topic_id: sports.id, creator_id: member.id)
Bookmark.create!(url: "businessinsider.com", topic_id: business.id, creator_id: member_two.id)
Bookmark.create!(url: "cnbc.com", topic_id: business.id, creator_id: member_two.id)

puts "Seed Finished"
puts "#{User.count} users, #{Topic.count} topics, #{Bookmark.count} bookmarks created."
