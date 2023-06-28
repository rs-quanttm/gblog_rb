require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) do
    build(:comment)
  end

  describe 'Assocations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to belong_to(:post) }
  end

  describe 'Valid subject' do
    it 'valid comment' do
      expect(comment).to be_valid
    end
  end

  describe 'Invalid length validations' do
    it 'validates content max length' do
      comment.content = 'a' * 256
      expect(comment).not_to be_valid
    end
  end
end
