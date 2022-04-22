FactoryBot.define do
  factory :photo do
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/flower_himawari_mark.png'))}
    content {"test_content"}
    address {"東京都港区芝公園４丁目２−８"}
  end
end
