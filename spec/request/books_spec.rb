require 'rails_helper'

RSpec.describe 'Books', type: :request do
  let(:book_cover_path) { Rails.root.join('db/seeder_assets/under_water.jpeg') }

  let(:blob) do 
    ActiveStorage::Blob.create_and_upload!(
      io: File.open(book_cover_path),
      filename: 'under_water',
      content_type: 'image/jpeg:',
    ).signed_id
  end

  let(:book) { create(:book, book_cover: blob) }

  describe 'GET /show' do
    it 'renders a successful response' do
      get book_path(id: book.isbn_number_13, format: :turbo_stream)
      expect(response).to have_http_status(:success)
    end
  end
end