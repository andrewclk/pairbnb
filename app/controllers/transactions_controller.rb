class TransactionsController < ApplicationController
	attr_accessor :listing
  def new
  	@current_reservation = current_user.reservations.last
  	@listing = Listing.find(@current_reservation.listing_id)
  	@listing_price = @listing.price
  	gon.client_token = generate_client_token
  end

  def create
  	@current_reservation = current_user.reservations.last
  	@listing = Listing.find(@current_reservation.listing_id)
  	@listing_price = @listing.price
    @result = Braintree::Transaction.sale(
              amount: @listing_price,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      redirect_to current_user, notice: "Congratulations! Your transaction has been successfully!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end

	  private
	def generate_client_token
	  Braintree::ClientToken.generate
	end
end
