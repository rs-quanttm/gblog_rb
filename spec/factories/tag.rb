FactoryBot.define do
  factory :tag do
    # jitera-anchor-dont-touch: columns
    content { Faker::Lorem.paragraph_by_chars(number: rand(0..255)) }
  end
end
