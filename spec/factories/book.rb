FactoryBot.define do
  factory :book do
    publisher
    title { 'Test title' }
    isbn_number_13 { '9781891830853' }
    isbn_number_10 { '1891830856' }
    price { 1200.00 }
    publish_at { DateTime.now }
    authors { create_list(:author, 1) }
  end
end
