require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録テスト', type: :model do
    context '名前が空の時' do
      it 'バリデーションにひっかる' do
        user = User.new(name: '', email: 'test@address', password: 'testdayo', password_confirmation: 'testdayo')
        expect(user).not_to be_valid
      end
    end

    context 'emailが空の時' do
      it 'バリデーションにひっかる' do
        user = User.new(name: 'test', email: '', password: 'testdayo', password_confirmation: 'testdayo')
        expect(user).not_to be_valid
      end
    end

    context 'passwordが空の時' do
      it 'バリデーションにひっかる' do
        user = User.new(name: 'test', email: 'test@address', password: '', password_confirmation: 'testdayo')
        expect(user).not_to be_valid
      end
    end
  end
end