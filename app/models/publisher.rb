class Publisher < ApplicationRecord
  has_many :book_publishers
  has_many :books, through: :book_publishers

  validates :name, precense: true
end