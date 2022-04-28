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
  password: "11111111",
  admin: "false",
  )

# photo完成

user = User.first
5.times do |n|
    Photo.create!(image:File.open("./public/DSC_1370.JPG"),
                content: "便利な釣りの本です。他の通販サイトより安い所を見つけました",
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
  Product.create!(photo_id: photo.id, price:2200 )
end

# Product_url 完成
5.times do |n|
  ProductUrl.create!(photo_id: photo.id, price_url: "https://www.amazon.co.jp/%E3%81%95%E3%81%8B%E3%81%AA%E3%83%BB%E9%87%A3%E3%82%8A%E6%A4%9C%E7%B4%A2-%E3%80%8C%E7%89%B9%E5%BE%B4-%E4%BB%95%E6%8E%9B%E3%81%91-%E3%81%95%E3%81%B0%E3%81%8D%E6%96%B9%E3%80%8D%E3%81%8C%E5%88%86%E3%81%8B%E3%82%8B672%E9%A0%81%E8%B6%85%E5%9B%B3%E9%91%91-%E3%81%A4%E3%82%8A%E4%BA%BA%E7%A4%BE/dp/4864473447/ref=sr_1_1?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&crid=22MBK8MZKIRGD&keywords=%E9%AD%9A+%E9%87%A3%E3%82%8A%E6%A4%9C%E7%B4%A2&qid=1650341781&sprefix=%E9%AD%9A+%E9%87%A3%E3%82%8A%E6%A4%9C%E7%B4%A2%2Caps%2C188&sr=8-1")
end


# お気に入り登録　完成
ary = Photo.pluck(:id)
photo = ary[0..4]
user = User.second
photo.each do |i|
  user.favorites.create(photo_id: i)
end
