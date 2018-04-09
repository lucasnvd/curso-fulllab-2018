class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items #:items, class_name: :OrderItem

  scope :from_user, ->(user_id) { where(user_id: user_id) }
  scope :current, -> { where(active: true) }

  before_create do
    self.token = SecureRandom.hex(24)
  end
end
