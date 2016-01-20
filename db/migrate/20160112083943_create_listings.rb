class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :user, index: true 
      t.text :name, index: true
      t.text :address, index: true
      t.text :city, index: true
      t.integer :price
      t.text :tag
      t.boolean :booking_status
      t.timestamps null: false
    end
  end
end
