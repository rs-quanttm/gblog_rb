require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    build(:user)
  end

  describe 'Assocations' do
    it { is_expected.to have_many(:posts) }

    it { is_expected.to have_many(:comments) }

    it { is_expected.to have_many(:likes) }
  end

  describe 'Valid subject' do
    it 'valid user' do
      expect(user).to be_valid
    end
  end

  describe 'Format option validations' do
    it { expect(user.email).to match(URI::MailTo::EMAIL_REGEXP) }
    it { expect(Faker::Lorem.sentence).not_to match(URI::MailTo::EMAIL_REGEXP) }
  end

  describe 'Invalid length validations' do
    it 'validates email max length' do
      user.email = 'a' * 256
      expect(user).not_to be_valid
    end
  end

  describe 'Invalid enum validations' do
    it 'validates roles enum value' do
      user = described_class.new
      expect { user.roles = 'invalid_enum' }.to raise_error(ArgumentError, "'invalid_enum' is not a valid roles")
    end
  end

  describe 'Validate uniqueness' do
    subject { build(:user) }

    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
