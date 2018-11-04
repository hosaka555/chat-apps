FactoryBot.define do
  factory :user do
    user_name "test_user"
    email "test@example.com"
    password "password"
    password_confirmation "password"
  end
end
