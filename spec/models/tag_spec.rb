require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) do
    build(:tag)
  end

  describe 'Assocations' do
    it { is_expected.to have_many(:posttaggings) }
  end

  describe 'Valid subject' do
    it 'valid tag' do
      expect(tag).to be_valid
    end
  end

  describe 'Invalid length validations' do
    it 'validates content max length' do
      tag.content = 'a' * 256
      expect(tag).not_to be_valid
    end
  end
end
