class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.string :image_url
      t.text :short_description
      t.text :long_description
      t.integer :rating, null: false

      t.timestamps
    end

    add_index :trips, :name
    add_index :trips, :rating
  end
end