class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :price
      t.string :status
      t.integer :client_id
      t.integer :employee_id
      t.integer :offer_id

      t.timestamps
    end
  end
end
