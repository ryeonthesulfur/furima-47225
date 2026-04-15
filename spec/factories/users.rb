FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    email                 { Faker::Internet.email }
    password              { 'test1234' }
    password_confirmation { password }
    birthday              { Faker::Date.birthday }
  end
end
