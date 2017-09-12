namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    #make_users
    #make_microposts
    #make_relationships
  end
end

def make_users
  admin = User.create!( login: "quantumInverter",
                        email: "example@gmail.com",
                        password: "foobar",
                        password_confirmation: "foobar",
                        admin: true)
  99.times do |n|
    login = "example-#{n+1}"
    email = "example-#{n+1}@gmail.com"
    password  = "password"
    User.create!(login: login,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.posts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
