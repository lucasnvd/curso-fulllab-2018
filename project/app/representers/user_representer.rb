class UserRepresenter < Representable::Decorator
  include Representable::Hash

  property :birth_date, render_filter: ->(i,_) { i.strftime('%d/%m/%Y') }
  property :address
  property :email
  property :state
  property :name
  property :city
end

