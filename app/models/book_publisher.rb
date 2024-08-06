class BookPublisher < ApplicationRecord
  belongs_to :publisher
  belongs_to :book
end