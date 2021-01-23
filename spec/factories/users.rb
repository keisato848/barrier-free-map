FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password {'test01'}
    password_confirmation {password}
    nickname {Faker::Name.name}
  end
end