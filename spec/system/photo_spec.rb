require 'rails_helper'

RSpec.describe "写真管理機能",type: :system do
  describe '投稿機能' do
    before do
      @user = FactoryBot.create(:user)
      visit root_path
      click_on "ユーザーログイン"
      fill_in "user_email",with:@user.email
      fill_in "user_password",with: @user.password
      click_on "ログイン"
    end
    context '写真投稿ボタンを押した場合' do
      it "作成した写真が表示される" do
        click_on "写真投稿"
        # binding.pry
        # sign_in @user
       
        @photos = FactoryBot.create(:photo)
        attach_file "photo_image", "spec/fixtures/flower_himawari_mark.png"
        fill_in "photo_content",with:@photo.content
        fill_in "photo_address",with: @photo.address
        click_on "投稿"
      end
    end
  end
  # describe '編集機能' do
  #   context '編集ボタンを押した場合' do
  #   it "" do
  # describe '削除機能' do
end