require 'rails_helper'

RSpec.describe "写真管理機能",type: :system do
  before do
    @user = FactoryBot.create(:user)
    visit root_path
    click_on "ユーザーログイン"
    fill_in "user_email",with:@user.email
    fill_in "user_password",with: @user.password
    click_on "ログイン"
  end

  describe '投稿機能' do
    context '写真投稿ボタンを押した場合' do
      it "作成した写真が表示される" do
        click_on "写真投稿"
        @photo = FactoryBot.create(:photo, user: @user)
        attach_file "photo_image", "spec/fixtures/flower_himawari_mark.png"
        fill_in "photo_content",with:@photo.content
        fill_in "photo_address",with: @photo.address
        click_on "投稿"
        expect(page).to have_content 'test_content'
      end
    end
  end 

  describe '詳細確認機能' do
    before do
      click_on "写真投稿"
      @photo = FactoryBot.create(:photo, user: @user)
      attach_file "photo_image", "spec/fixtures/flower_himawari_mark.png"
      fill_in "photo_content",with:@photo.content
      fill_in "photo_address",with: @photo.address
      click_on "投稿"
      visit photos_path
    end
    context '詳細ボタンを押した場合' do
      it '写真の詳細画面に飛ぶ' do
        click_on "詳細",match: :first
        visit photo_path(@photo.id)
      end
    end
  end

  describe '編集機能' do
    before do
      click_on "写真投稿"
      @photo = FactoryBot.create(:photo, user: @user)
      attach_file "photo_image", "spec/fixtures/flower_himawari_mark.png"
      fill_in "photo_content",with:@photo.content
      fill_in "photo_address",with: @photo.address
      click_on "投稿"
      visit photos_path
    end

    context '編集ボタンを押した場合' do
      it "画像関連の情報を編集できる" do
        click_on "編集",match: :first
        @second_photo = FactoryBot.create(:second_photo, user: @user)
        attach_file "photo_image", "spec/fixtures/shinkai_kujira_hone.png"
        fill_in "photo_content",with:@second_photo.content
        fill_in "photo_address",with: @second_photo.address
        click_on "投稿"
        expect(page).to have_content 'test_content2'
      end
    end
  end

  describe '削除機能' do
    before do
      click_on "写真投稿"
      @photo = FactoryBot.create(:photo, user: @user)
      attach_file "photo_image", "spec/fixtures/flower_himawari_mark.png"
      fill_in "photo_content",with:@photo.content
      fill_in "photo_address",with: @photo.address
      click_on "投稿"
      visit photos_path
    end
    context '削除ボタンを押した場合' do
      it "画像を削除できる" do
        click_on "削除",match: :first
        expect(page).to have_content '投稿写真を削除しました！'
      end
    end
  end 
end