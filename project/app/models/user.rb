class User < ApplicationRecord
  has_many :orders

  scope :by_state, ->(state) { where(state: state) }
  scope :by_email, ->(email) { where(email: email) }
  scope :by_name,  ->(name)  { where("name LIKE '%#{name}%'") }

  validates :address, presence: true
  validates :number, presence: true
  validates :email, presence: true #, format: { with: // }
  validates :state, presence: true, length: { is: 2 }
  validates :name, presence: true
  validates :city, presence: true

end