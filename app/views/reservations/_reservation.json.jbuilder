json.extract! reservation, :id, :price, :status, :client_id, :employee_id, :offer_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
