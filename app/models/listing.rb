require 'elasticsearch/model'

class Listing < ActiveRecord::Base
	# include Elasticsearch::Model
 #  	include Elasticsearch::Model::Callbacks
  	has_many :reservation
	belongs_to :user
	searchkick



end

# Listing.import force: true
