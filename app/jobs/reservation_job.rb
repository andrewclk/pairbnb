class ReservationJob < ActiveJob::Base
	queue_as :default

	def perform(input)
		# byebug
		@reservation = Reservation.find(input)
		ReservationMailer.booking_email(@reservation).deliver_now
	end
end