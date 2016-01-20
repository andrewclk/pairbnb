class AddNumberToListings < ActiveRecord::Migration
  def change
    add_column :listings, :number, :integer
  end
end
