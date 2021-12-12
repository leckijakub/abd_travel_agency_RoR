class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    #drop_table :users
    create_table :users do |t|
      t.string :uid
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :surname
    end
  end
end
