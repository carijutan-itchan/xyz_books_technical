class Book < ApplicationRecord
  belongs_to :author
  has_many :book_publishers
  has_many :publishers, through: :book_publishers
end