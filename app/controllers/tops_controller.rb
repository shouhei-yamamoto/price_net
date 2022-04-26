class TopsController < ApplicationController
  def index
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com', name:'ゲスト') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now  
      user.name = "ゲスト"
    end
    sign_in user
    redirect_to photos_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def admin_guest_sign_in
    user = User.find_or_create_by!(email: 'admin_guest@example.com', name:'ゲスト(管理者)', admin:true) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now 
      user.name = "ゲスト(管理者)"
    end
    sign_in user
    redirect_to photos_path, notice: 'ゲスト(管理者)ユーザーとしてログインしました。'
  end
end
