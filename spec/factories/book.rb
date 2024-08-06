FactoryBot.define do
  factory :book do
    author
    title { 'Test title' }
    isbn_number { '120-205-2345-12' }
    price { 1200.00 }
    publish_at { DateTime.now }
    publishers { create_list(:publisher, 1) }
  end
end
