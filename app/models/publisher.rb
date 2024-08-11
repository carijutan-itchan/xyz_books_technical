class Publisher < ApplicationRecord
  has_one :books

  validates :name, presence: true
end