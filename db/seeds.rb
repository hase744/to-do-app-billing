# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
10.times do |i|
    User.create(email: "example#{i}@.com", password:"password", name:"ユーザー#{i}")
end
#   Character.create(name: "Luke", movie: movies.first)
10.times do |i|
    how_to_judge = 'me'
    if i%2 == 0 && i>1
        how_to_judge = 'other'
        judger = User.find(i-1)
    end
    Todo.create!(
        title:"タイトル#{i}", 
        user: User.find(i+1), 
        description:"ToDo説明#{i}", 
        deadline:DateTime.now + i, 
        price:i*100,
        other_user_email: judger&.email,
        how_to_judge:how_to_judge,
        )
end

user = User.create!(
    email: ENV["EMAIL1"],
    name: "ハセ",
    password: ENV["PASSWORD"],
    stripe_card_id: ENV["STRIPE_CARD_ID"],
    stripe_customer_id: ENV["STRIPE_CUSTOMER_ID"],
    #password_confirmation: ENV["PASSWORD"],
)
user = User.create!(
    email: ENV["EMAIL2"],
    name: "ハセ",
    password: ENV["PASSWORD"],
    stripe_card_id: ENV["STRIPE_CARD_ID"],
    stripe_customer_id: ENV["STRIPE_CUSTOMER_ID"],
    #password_confirmation: ENV["PASSWORD"],
)

10.times do |i|
    deadline = DateTime.now - 5 + i
    achieved_at = nil
    if deadline < DateTime.now
        if i%2 == 0
            achieved_at = deadline
        end
    end
    Todo.create!(
        title:"タイトル#{i}", 
        user: User.find_by(email: ENV["EMAIL1"]),
        description:"ToDo説明#{i}", 
        deadline:deadline, 
        achieved_at: deadline,
        how_to_judge: 'me',
        price:i*100
        )
end