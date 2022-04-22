FactoryBot.define do
  factory :user do
    name { "テストユーザー" }
    email { "test@gmail.com" }
    password { "12345678" }
    admin { "false" }
  end

  factory :second_user,class: User do
    name { "テストユーザー2" }
    email { "test2@gmail.com" }
    password { "22222222" }
    admin { "false" }
  end

  factory :admin_user,class: User do
    name { "テスト管理者" }
    email { "admintest@example.com" }
    password { "33333333" }
    admin { "true" }
  end
end