class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.boolean :active, default: true
      t.string :token

      t.timestamps
    end
  end
end
