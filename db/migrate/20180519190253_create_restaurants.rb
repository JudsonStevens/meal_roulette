class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :address
      t.integer :phone_number
      t.text :yelp_review_link

      t.timestamps
    end
  end
end
