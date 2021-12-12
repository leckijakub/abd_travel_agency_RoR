class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :address
      t.string :phone_number
    end
  end
end
