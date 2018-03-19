class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :contact_email
      t.string :contact_phone
      t.string :name

      t.timestamps
    end
  end
end
