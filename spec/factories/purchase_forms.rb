FactoryBot.define do
  factory :purchase_form do
    token            {'tok_abcdefghijk00000000000000000'}
    post_code        {'123-4567'}
    prefecture_id    { Faker::Number.within(range: 2..11) }
    city             {'市区町村'}
    block            {'番地'}
    building         {'建物'}
    phon_number      {'1234567890'}
  end
end
