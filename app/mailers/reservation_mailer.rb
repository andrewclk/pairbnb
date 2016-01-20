class ReservationMailer < ApplicationMailer

	def booking_email(reservation)
		@reservation = reservation
		@customer = User.find(@reservation.user_id)
		@url = "www.google.com"
		@host = @reservation.listing.user
		mail(to: @host.email, subject: "You have received a booking from #{@customer.name}")
	end
end
