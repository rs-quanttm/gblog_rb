require 'rails_helper'

RSpec.describe Posttagging, type: :model do
  let(:posttagging) do
    build(:posttagging)
  end

  describe 'Assocations' do
    it { is_expected.to belong_to(:post) }

    it { is_expected.to belong_to(:tag) }
  end

  describe 'Valid subject' do
    it 'valid posttagging' do
      expect(posttagging).to be_valid
    end
  end
end
