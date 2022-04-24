require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe '写真モデルバリデーションテスト', type: :model do
    context '写真が空の場合' do
      it 'バリデーションにひっかる' do
        photo = Photo.new(image: '', content: 'test_content', address: '東京都港区芝公園４丁目２−８')
        expect(photo).not_to be_valid
      end
    end

    context '写真説明が空の場合' do
      it 'バリデーションにひっかる' do
        photo = Photo.new(image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/flower_himawari_mark.png')), 
                          content: '', 
                          address: '東京都港区芝公園４丁目２−８'
                          )
        expect(photo).not_to be_valid
      end
    end
    
    context '住所が空の場合' do
      it 'バリデーションにひっかる' do
        photo = Photo.new(image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/flower_himawari_mark.png')), 
                          content: 'test_content', 
                          address: ''
                          )
        expect(photo).not_to be_valid
      end
    end
  end
end

