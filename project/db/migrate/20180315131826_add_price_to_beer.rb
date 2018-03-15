class AddPriceToBeer < ActiveRecord::Migration[5.1]
  def change
    add_column :beers, :price, :float, default: 0.0
  end
end
