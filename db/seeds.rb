require 'faker'

rand(10..30).times do
  p = Bookmark.create(title: Faker::Lorem.words(rand(1..10)).join(" "), burl: Faker::Lorem.paragraphs(rand(1..4)).join("\n"))
end

puts "Seed finished"
puts "#{Bookmark.count} bookmarks created"
