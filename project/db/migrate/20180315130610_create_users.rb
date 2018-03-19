class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table(:users) do |t|
      t.string(:name)
      t.string :email
      t.datetime :birth_date
    end
  end

  def down
    drop_table(:users) if table_exists?(:users)
  end
end
