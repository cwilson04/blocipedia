require 'faker'

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

users = User.all

10.times do
  Wiki.create!(
    user: users.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph,
    private: false
  )
end
@wiki = Wiki.all
 
 
puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"