FactoryBot.define do
  factory :photo do
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/flower_himawari_mark.png'))}
    content {"test_content"}
    address {"東京都港区芝公園４丁目２−８"}
  end

  factory :second_photo, class: Photo do
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/shinkai_kujira_hone.png'))}
    content {"test_content2"}
    address {"東京都墨田区押上１丁目１−２"}
  end
end
