json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :pet_type, :breed, :age, :weight, :last_visit_date, :customer_id
  json.url pet_url(pet, format: :json)
end
