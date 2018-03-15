class AddingAddressToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.integer :number, null: false
      t.string :address, null: false
      t.string :state,   limit: 2, null: false
      t.string :city,    null: false
    end
  end
end
