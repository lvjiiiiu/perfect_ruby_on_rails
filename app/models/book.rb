class Book < ApplicationRecord
  scope :costly, -> {where("price>?", 3000)}
  # Book.costly は　Book.where("price>?", 3000)と等価
  scope :written_about, -> (theme){ where("name like?", "%#{theme}%")}
  scope :find_price, -> (price){find_by(price:price)}

  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, presence:true
  validates :name, length: {maximum: 25}
  validates :price, numericality: {greater_than_or_equal_to: 0}

  validate do |book|
    if book.name.include?("exercise")
      book.errors[:name] << "I don't like exercise."
    end
  end
end
