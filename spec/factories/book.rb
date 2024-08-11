FactoryBot.define do
  factory :book do
    publisher
    title { 'Test title' }
    isbn_number { '120-205-2345-12' }
    price { 1200.00 }
    publish_at { DateTime.now }
    authors { create_list(:author, 1) }
  end
end
