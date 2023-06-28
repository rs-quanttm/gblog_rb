require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) do
    build(:like)
  end

  describe 'Assocations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to belong_to(:post) }
  end

  describe 'Valid subject' do
    it 'valid like' do
      expect(like).to be_valid
    end
  end
end
