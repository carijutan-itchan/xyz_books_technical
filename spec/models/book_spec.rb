require 'rails_helper'

describe Book do
  it 'has a valid book' do
    expect(build(:book)).to be_valid
  end

  describe '#validations' do
    context 'when title is not present' do
      let(:title) { nil }

      it { expect(build(:book, title:)).not_to be_valid }
    end

    context 'when isbn number is not present' do
      let(:isbn_number_13) { nil }

      it { expect(build(:book, isbn_number_13:)).not_to be_valid }
    end

    context 'when isbn number is duplicated' do
      before { create(:book, isbn_number_13: '123123') }

      let(:isbn_number_13) { '123123' }

      it { expect(build(:book, isbn_number_13:)).not_to be_valid }
    end

    context 'when price is not present' do
      let(:price) { nil }

      it { expect(build(:book, price:)).not_to be_valid }
    end

    context 'when publish_at is not present' do
      let(:publish_at) { nil }

      it { expect(build(:book, publish_at:)).not_to be_valid }
    end

    context 'when publisher is not present' do
      let(:publisher) { nil }

      it { expect(build(:book, publisher:)).not_to be_valid }
    end
  end

  describe '#at_least_one_author' do
    context 'when book does not have author' do
      let(:authors) { [] }

      it { expect(build(:book, authors:)).not_to be_valid }
    end

    context 'when book does have author' do
      let(:authors) { build_list(:author, 1) }

      it { expect(build(:book, authors:)).to be_valid }
    end
  end
end