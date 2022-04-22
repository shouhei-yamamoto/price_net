require 'rails_helper'
before do
  visit root_path
  click_on "ユーザーログイン"
  fill_in "user_email",with: "test@gmail.com"
  fill_in "user_password",with: "12345678"
  click_on "ログイン"
end
RSpec.describe "写真管理機能",type: :system do
  describe '投稿機能' do
    context '写真投稿ボタンを押した場合' do
      it "作成した写真が表示される" do
      end
    end
  end
  # describe '編集機能' do
  #   context '編集ボタンを押した場合' do
  #   it "" do
  # describe '削除機能' do
end