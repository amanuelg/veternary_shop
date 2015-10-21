json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :doctor_id, :pet_id, :customer_id, :reminder, :date_of_visit, :reason_for_visit
  json.url appointment_url(appointment, format: :json)
end
