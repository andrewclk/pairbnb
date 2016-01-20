class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.references :user, index: true
    	t.references :listing, index: true
      t.integer :number_of_guest
      t.datetime :start_date
      t.datetime :end_date
      t.string :extra_request

      t.timestamps null: false
    end
  end
end
