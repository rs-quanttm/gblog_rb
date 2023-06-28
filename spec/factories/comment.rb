FactoryBot.define do
  factory :comment do
    user { build(:user) }

    post { build(:post) }

    # jitera-anchor-dont-touch: columns
    content { Faker::Lorem.paragraph_by_chars(number: rand(0..255)) }
  end
end
