class Book < ApplicationRecord
  belongs_to :author
  has_many :book_publishers
  has_many :publishers, through: :book_publishers

  validates :title, :isbn_number, :price, :publish_at, presence: true
  validate :at_least_one_publisher

  private

  def at_least_one_publisher
    if publishers.empty?
      errors.add(:publishers, "need at least one publishers")
    end
  end
end