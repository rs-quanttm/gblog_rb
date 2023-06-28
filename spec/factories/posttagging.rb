FactoryBot.define do
  factory :posttagging do
    post { build(:post) }

    tag { build(:tag) }

    # jitera-anchor-dont-touch: columns
  end
end
