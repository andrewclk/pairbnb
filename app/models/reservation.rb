class Reservation < ActiveRecord::Base
	belongs_to :listing
  	belongs_to :users
end
