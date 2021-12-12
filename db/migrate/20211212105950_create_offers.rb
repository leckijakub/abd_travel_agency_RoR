class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :ta_name
      t.string :uid
      t.string :transport
      t.string :accomodation
      t.string :event
      t.integer :organizer_id
    end
  end
end
