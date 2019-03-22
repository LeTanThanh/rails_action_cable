# seed users
10.times do
  name = FFaker::Name.name
  email = name.split(" ").map(&:downcase).join("_") + "@gmail.com"

  User.create name: name, email: email,
    password: "12345678", password_confirmation: "12345678"
end

# seed chat_rooms
User.all.sample(10).each do |user|
  2.times do
    user.chat_rooms.create title: FFaker::Lorem.phrase
  end
end
