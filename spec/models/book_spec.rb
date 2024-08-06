require 'rails_helper'

describe Book do
  let(:book) { create(:book) }

  it 'has a valid book' do
    expect(build(:book)).to be_valid
  end

  describe '#validations' do
    context 'when title is not present' do
      let(:title) { nil }

      it { expect(build(:book, title:)).not_to be_valid }
    end

    context 'when isbn number is not present' do
      let(:isbn_number) { nil }

      it { expect(build(:book, isbn_number:)).not_to be_valid }
    end

    context 'when price is not present' do
      let(:price) { nil }

      it { expect(build(:book, price:)).not_to be_valid }
    end

    context 'when publish_at is not present' do
      let(:publish_at) { nil }

      it { expect(build(:book, publish_at:)).not_to be_valid }
    end

    context 'when author is not present' do
      let(:author) { nil }

      it { expect(build(:book, author:)).not_to be_valid }
    end
  end

  describe '#at_least_one_publisher' do
    context 'when book does not have publisher' do
      let(:publishers) { [] }

      it { expect(build(:book, publishers:)).not_to be_valid }
    end

    context 'when book does have publisher' do
      let(:publishers) { build_list(:publisher, 1) }

      it { expect(build(:book, publishers:)).to be_valid }
    end
  end
end