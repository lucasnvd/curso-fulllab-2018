class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :order
      t.belongs_to :beer
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
