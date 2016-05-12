require 'faker'

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

10.times do
  Wiki.create!(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
end
@wiki = Wiki.all
 
 
puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"