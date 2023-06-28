require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) do
    build(:post)
  end

  describe 'Assocations' do
    it { is_expected.to have_many(:comments) }

    it { is_expected.to have_many(:likes) }

    it { is_expected.to have_many(:posttaggings) }

    it { is_expected.to belong_to(:user) }
  end

  describe 'Valid subject' do
    it 'valid post' do
      expect(post).to be_valid
    end
  end

  describe 'Invalid length validations' do
    it 'validates title max length' do
      post.title = 'a' * 256
      expect(post).not_to be_valid
    end

    it 'validates content max length' do
      post.content = 'a' * 256
      expect(post).not_to be_valid
    end
  end

  describe 'Invalid enum validations' do
    it 'validates status enum value' do
      post = described_class.new
      expect { post.status = 'invalid_enum' }.to raise_error(ArgumentError, "'invalid_enum' is not a valid status")
    end
  end
end
