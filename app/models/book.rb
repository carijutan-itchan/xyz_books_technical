class Book < ApplicationRecord
  has_one_attached :book_cover

  belongs_to :publisher

  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :title, :price, :publish_at, :publisher, presence: true
  validates :isbn_number_10, presence: true, uniqueness: true
  validates :isbn_number_13, presence: true, uniqueness: true
  validate :at_least_one_author

  def self.search_by_isbn(isbn_number)
    isbn_10 = find_by(isbn_number_10: isbn_number)

    return isbn_10 if isbn_10.present?

    find_by(isbn_number_13: isbn_number)
  end

  private

  def at_least_one_author
    if authors.empty?
      errors.add(:base, "need at least one authors")
    end
  end
end