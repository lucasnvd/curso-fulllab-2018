class Provider < ApplicationRecord
  scope :by_email, ->(email) { where(contact_email: email) }
  scope :by_name,  ->(name)  { where("name LIKE '%#{name}%'") }

  validates :contact_email, presence: true
  validates :contact_phone, presence: true
  validates :name, presence: true
end
