class TopsController < ApplicationController
  def index
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com', name:'ゲスト', image:'app/assets/images/building_kaisya_small.png') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      user.name = "ゲスト"# 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
      # user.image.attach(io: File.open(Rails.root.join("app/assets/images/building_kaisya_small.png")), filename: "building_kaisya_small.png")
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def admin_guest_sign_in
    user = User.find_or_create_by!(email: 'admin_guest@example.com', name:'ゲスト(管理者)', admin:true) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      user.name = "ゲスト(管理者)"# 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
      # user.image.attach(io: File.open(Rails.root.join("app/assets/images/building_kaisya_small.png")), filename: "building_kaisya_small.png")
    end
    sign_in user
    redirect_to root_path, notice: 'ゲスト(管理者)ユーザーとしてログインしました。'
  end
end
