class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :user, index: true 
      t.text :name
      t.text :address
      t.text :city
      t.integer :price
      t.text :tag
      t.boolean :booking_status
      t.timestamps null: false
    end
  end
end
