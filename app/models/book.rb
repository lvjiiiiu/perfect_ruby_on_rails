class Book < ApplicationRecord
  scope :costly, -> {where("price>?", 3000)}
  # Book.costly は　Book.where("price>?", 3000)と等価
  scope :written_about, -> (theme){ where("name like?", "%#{theme}%")}
  scope :find_price, -> (price){find_by(price:price)}
end
