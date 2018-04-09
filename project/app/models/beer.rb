class Beer < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items

  scope :by_alcohol, ->(from, to) { where(alcohol: from..to) }
  scope :by_price,   ->(from, to) { where(price: from..to) }
  scope :by_style,   ->(style)    { where("style LIKE '%#{style}%'") }
  scope :by_name,    ->(name)     { where("name LIKE '%#{name}%'") }

  validates :alcohol, presence: true
  validates :style,   presence: true
  validates :price,   presence: true
  validates :name,    presence: true

end
