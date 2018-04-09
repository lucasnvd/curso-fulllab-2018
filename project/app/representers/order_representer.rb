class OrderRepresenter < Representable::Decorator
  include Representable::Hash

  property :created_at
  property :updated_at
  property :token

  collection :order_items, decorator: OrderItemRepresenter
end

