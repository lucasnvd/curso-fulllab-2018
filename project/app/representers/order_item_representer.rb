class OrderItemRepresenter < Representable::Decorator
  include Representable::Hash

  property :created_at
  property :updated_at
  property :quantity

  property :beer, decorator: BeerRepresenter
end

