class BeerProviderControl < ApplicationRecord
  belongs_to :provider
  belongs_to :beer

  scope :available_provider, ->(beer_id) { where('quantity > 0 And beer_id = ?', beer_id) }
  scope :available_quantity, ->(beer_id, quantity) { where('quantity >= ? And beer_id = ?', quantity, beer_id) }

end
