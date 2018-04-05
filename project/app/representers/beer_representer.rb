class BeerRepresenter < Representable::Decorator
  include Representable::Hash

  property :alcohol, render_filter: ->(i, _) { "#{i.round(2)}%"}
  property :style
  property :price, render_filter: ->(i, _) { "$ #{i.round(2)}"}
  property :name
end

