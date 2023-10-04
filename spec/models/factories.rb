FactoryBot.define do
  factory :user do
    name { 'tester_111' }
    email { 'mail44@mail.com' }
    password { '12345678' }
    password_confirmation { '12345678' }
  end
end
