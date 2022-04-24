FactoryBot.define do
  factory :comment do
    content { "test" }
  end

  factory :second_comment, class: Comment  do
    content { "second_test" }
  end
end