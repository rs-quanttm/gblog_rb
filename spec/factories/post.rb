FactoryBot.define do
  factory :post do
    user { build(:user) }

    # jitera-anchor-dont-touch: columns
    status { 'init' }
    content { Faker::Lorem.paragraph_by_chars(number: rand(0..255)) }
    title { Faker::Lorem.paragraph_by_chars(number: rand(0..255)) }
  end
end
