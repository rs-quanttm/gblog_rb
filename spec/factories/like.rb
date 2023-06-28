FactoryBot.define do
  factory :like do
    user { build(:user) }

    post { build(:post) }

    # jitera-anchor-dont-touch: columns
  end
end
