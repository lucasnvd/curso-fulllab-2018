module Orders
  class AddItemService
    include Wisper::Publisher

    def initialize(user_id, input = {})
      @user = User.find_by(id: user_id)
      @current_order = @user.orders.current.first || @user.orders.create(active: true)
      @input = input
    end

    def call
      if available_beer?
        append_item_to_order
        remove_from_provider_stock

        broadcast(:added, @current_order)
      else
        broadcast(:failed, unavailable_response)
      end
    end

    private

    def available_beer?
      BeerProviderControl.available_quantity(@input[:beer_id], @input[:quantity]).exists?
    end

    def already_added_item?
      @current_order.order_items.exists?(beer_id: @input[:beer_id])
    end

    def append_item_to_order
      return only_increment_quantity if already_added_item?
      add_new_item
    end

    def only_increment_quantity
      item = @current_order.order_items.find_by(beer_id: @input[:beer_id])
      item.increment!(:quantity, @input[:quantity])
    end

    def add_new_item
      @current_order.order_items.create(quantity: @input[:quantity], beer_id: @input[:beer_id])
    end

    def remove_from_provider_stock
      stock = BeerProviderControl.available_provider(@input[:beer_id]).first
      stock.decrement!(:quantity, @input[:quantity])
    end

    def unavailable_response
      {
        message: 'Infelizmente já vendemos todas as unidades.',
        code: 101
      }
    end
  end
end