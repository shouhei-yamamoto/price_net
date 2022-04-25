require 'rails_helper'
RSpec.describe "コメント管理機能",type: :system do
  before do
    @user = FactoryBot.create(:user)
    visit root_path
    click_on "ユーザーログイン"
    fill_in "user_email",with:@user.email
    fill_in "user_password",with: @user.password
    click_on "ログイン"
  end

  describe 'コメント投稿' do
    before do
      click_on "写真投稿"
      @photo = FactoryBot.create(:photo, user: @user)
      attach_file "photo_image", "spec/fixtures/flower_himawari_mark.png"
      fill_in "photo_content",with:@photo.content
      fill_in "photo_address",with: @photo.address
      click_on "投稿"
    end
    context '写真詳細画面のコメント登録を押す' do
      it "コメントが投稿される" do
        @comment = FactoryBot.create(:comment, user: @user, photo: @photo)
        fill_in "comment_content",with:@comment.content
        click_on "登録する"
        expect(page).to have_content 'test'
      end
    end
  end

  describe 'コメント編集', js: true do
    before do
      click_on "写真投稿"
      @photo = FactoryBot.create(:photo, user: @user)
      attach_file "photo_image", "spec/fixtures/flower_himawari_mark.png"
      fill_in "photo_content",with:@photo.content
      fill_in "photo_address",with: @photo.address
      click_on "投稿"
      @comment = FactoryBot.create(:comment, user: @user, photo: @photo)
      fill_in "comment_content",with:@comment.content
      click_on "登録する"
    end
    context 'コメント編集を押す' do
      it "コメントが変更される" do
        click_on "コメント編集", match: :first
        # find("コメント編集").click
        @second_comment = FactoryBot.create(:second_comment, user: @user, photo: @photo)
        # binding.pry
        fill_in "comment_content",with:@second_comment.content
        click_on "更新する"
      end
    end
  end

    
  describe 'コメント削除', js: true do
    before do
      click_on "写真投稿"
      @photo = FactoryBot.create(:photo, user: @user)
      attach_file "photo_image", "spec/fixtures/flower_himawari_mark.png"
      fill_in "photo_content",with:@photo.content
      fill_in "photo_address",with: @photo.address
      click_on "投稿"
      @comment = FactoryBot.create(:comment, user: @user, photo: @photo)
      fill_in "comment_content",with:@comment.content
      click_on "登録する"
    end
    context 'コメント削除を押す' do
      it "コメントが削除される" do
        click_on "コメント削除", match: :first
      end
    end
  end
end