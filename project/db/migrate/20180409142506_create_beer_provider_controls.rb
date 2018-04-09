class CreateBeerProviderControls < ActiveRecord::Migration[5.1]
  def change
    create_table :beer_provider_controls do |t|
      t.belongs_to :beer
      t.belongs_to :provider
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
