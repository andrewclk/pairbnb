class SearchController < ApplicationController
	# Listing.reindex
	def search
	  if params[:q].nil?
	    @listings = []
	  else
	    @listings = Listing.search params[:q], fields: [:name, :address, :city]
	    # byebug
	  end
	end
end
