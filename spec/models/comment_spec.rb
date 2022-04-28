require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント投稿テスト', type: :model do
    context '空で登録しようとする時' do
      it 'バリデーションにひっかかる' do
        comment = Comment.new(content: '')
        expect(comment).not_to be_valid
      end
    end
  end
end