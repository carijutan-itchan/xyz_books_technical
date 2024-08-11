class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end