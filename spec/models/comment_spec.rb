require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント投稿テスト', type: :model do
    context '空で登録しようとする時' do
      it 'バリデーションにひっかかる' do
        # @user = FactoryBot.create(:user)
        # @photo = FactoryBot.create(:photo, user: @user)
        # user = User.new(name: 'test', email: 'test@address', password: 'testdayo', password_confirmation: 'testdayo')
        comment = Comment.new(content: '')
        # comment = Comment.new(content: '', name: @user.name)
        # comment = Comment.new(content: '', photo_id: @photo.id, user_id: @user.id)
        expect(comment).not_to be_valid
      end
    end
  end
end