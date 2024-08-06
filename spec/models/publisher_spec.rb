require 'rails_helper'

describe Publisher do
  let(:publisher) { create(:publisher) }

  it 'has a valid publisher' do
    expect(build(:publisher)).to be_valid
  end

  describe '#validations' do
    context 'when name is not present' do
      let(:name) { nil }

      it { expect(build(:publisher, name:)).not_to be_valid }
    end
  end
end