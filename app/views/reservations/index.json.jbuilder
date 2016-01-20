json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :number_of_guest, :start_date, :end_date, :extra_request
  json.url reservation_url(reservation, format: :json)
end
