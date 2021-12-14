class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :price
      t.string :status
      t.references :client, foreign_key: true, null: false
      t.references :employee, foreign_key: true
      t.references :offer, foreign_key: true, null: false
    end
  end
end
