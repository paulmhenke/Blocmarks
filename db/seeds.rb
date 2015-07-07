require 'faker'

member = User.create!(name: "Member User", email: "member@example.com", password: "helloworld", password_confirmation: "helloworld")
member.save!

sports = Topic.create!(title: "Sports", user_id: member.id)
sports.save!
business = Topic.create!(title: "Business", user_id: member.id)
business.save!

Bookmark.create!(url: "www.espn.com", topic_id: sports.id)
Bookmark.create!(url: "www.si.com", topic_id: sports.id)
Bookmark.create!(url: "businessinsider.com", topic_id: business.id)
Bookmark.create!(url: "cnbc.com", topic_id: business.id)

puts "Seed Finished"
puts "#{User.count} users, #{Topic.count} topics, #{Bookmark.count} bookmarks created."
