# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 提出前にデータを削除してからseedを実行すること！

#User作成OK
5.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               admin: false
               )
end

@user = User.create!(
  name: "normal",
  email: "normal@example.jp",
  password: "22222222",
  admin: "false",
  confirmed_at: Time.now
  )

# photo完成

user = User.first
5.times do |n|
    Photo.create!(image:File.open("./public/adpDSC_5649-e1499482537656-499x750.jpg"),
                content: "aaaa",
                address: "東京都港区芝公園４丁目２−８",
                user_id: user.id
                )
end

# コメント完成
photo = Photo.first
5.times do |n|
  Comment.create!(photo_id: photo.id, user_id: user.id, content: "test_#{n}")
end

# ラベル完成
5.times do |n|
  Label.create!(name:"label#{n}")
end

# Product 完成
5.times do |n|
  Product.create!(photo_id: photo.id, price: 555)
end

# Product_url 完成
5.times do |n|
  ProductUrl.create!(photo_id: photo.id, price_url: "https://diveintocode.jp/corporate")
end


# お気に入り登録　完成
ary = Photo.pluck(:id)
photo = ary[0..4]
user = User.second
photo.each do |i|
  user.favorites.create(photo_id: i)
end
