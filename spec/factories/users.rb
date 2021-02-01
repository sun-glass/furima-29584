FactoryBot.define do
  factory :user do
    nick_name             { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '安倍' }
    first_name            { '遼介' }
    last_name_kana        { 'アベ' }
    first_name_kana       { 'リョウスケ' }
    birth_date            { '1994-02-11' }
  end
end
