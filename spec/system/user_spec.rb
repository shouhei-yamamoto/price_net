require 'rails_helper'
RSpec.describe 'ユーザ登録・ログイン・ログアウト機能・管理画面テスト', type: :system do
  describe 'ユーザ登録のテスト' do
    context 'ユーザ登録がなくログインしていない場合' do
      it 'ユーザ新規登録のテスト' do
        visit root_path
        click_on '新規登録'
        fill_in 'user_name', with: 'てづか'
        fill_in 'user_email', with: 'te@gmail.com'
        fill_in 'user_password', with: '44444444'
        fill_in 'user_password_confirmation', with: '44444444'
        click_on 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
      it '​ログインしていない時はログイン画面に飛ぶテスト​' do
        visit photos_path
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
      end
    end
  end

  describe '一般ユーザーsession機能テスト' do
    before do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:second_user)
    end
    context "ログインしていない状態でユーザデータがある場合" do
      it 'ログインができること' do
        visit root_path
        click_on "ユーザーログイン"
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        click_on "ログイン"
        expect(current_path).to eq photos_path      
      end
    end

    context 'ログインしている場合' do
      before do
        visit root_path
        click_on "ユーザーログイン"
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        click_on "ログイン"        
      end

      it '自分の詳細画面に飛べること' do
        visit user_path(id: @user.id)
        expect(current_path).to eq user_path(id: @user.id)
      end 
      
      it "一般ユーザが他人の詳細画面に飛ぶと写真一覧ページに遷移すること" do
        visit user_path(id: @second_user.id)
        expect(page).to have_content "他人のページへアクセスはできません"
      end

      it "ログアウトができる" do
        click_on "ログアウト"
        expect(page).to have_content "ログアウトしました。"
      end
    end     
  end

  describe "管理画面のテスト" do
    context "管理ユーザ作成" do
      it "管理者は管理画面にアクセスできること" do
        @admin_user = FactoryBot.create(:admin_user)
        visit root_path
        click_on "ユーザーログイン"
        fill_in "user_email", with: @admin_user.email
        fill_in "user_password", with: @admin_user.password
        click_on "ログイン"
        sleep 0.3
        click_on "管理画面"
        expect(current_path).to eq  rails_admin_path
      end
    end
  
    context "管理者でログインしている場合" do
      before do
        @admin_user = FactoryBot.create(:admin_user)
        visit root_path
        click_on "ユーザーログイン"
        fill_in "user_email", with: @admin_user.email
        fill_in "user_password", with: @admin_user.password
        click_on "ログイン"
        visit rails_admin_path
      end

      it "管理者はユーザ新規登録ができる" do
        click_on "ユーザー",match: :first
        click_on "新規作成"
        fill_in "user_name", with: "みうら"
        fill_in "user_email", with: "miura@example.com"
        fill_in "user_password", with: "66666666"
        click_on "_save"
        expect(page).to have_content "miura@example.com"       
      end
    

      it "管理者はユーザの詳細画面へ行ける" do
        @user = FactoryBot.create(:user)
        visit user_path(id: @user.id)
      end
      
      # it "管理者ユーザーの編集画面からユーザーの編集ができる" do
      #   @user = FactoryBot.create(:user)
      #   visit edit_admin_user_path(id: @user.id)
      #   fill_in 'user_name', with: 'test_user'
      #   fill_in 'user_email', with: 'test_user@test.com'
      #   fill_in 'user_password', with: '345678'
      #   click_on '更新'
      #   expect(page).to have_content "test_user"
      # end
      
      it "管理者はユーザーを削除できる" do
        click_on "ユーザー",match: :first
        click_on "nav-link",match: :first
      end
    end
  end
end