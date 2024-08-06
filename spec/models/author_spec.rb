require 'rails_helper'

describe Author do
  let(:author) { create(:author) }

  it 'has a valid author' do
    expect(build(:author)).to be_valid
  end

  describe '#validations' do
    context 'when first_name is not present' do
      let(:first_name) { nil }

      it { expect(build(:author, first_name:)).not_to be_valid }
    end

    context 'when last name is not present' do
      let(:last_name) { nil }

      it { expect(build(:author, last_name:)).not_to be_valid }
    end
  end
end