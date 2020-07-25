json.extract! place_order, :id, :name, :address, :email, :pay_type, :created_at, :updated_at
json.url place_order_url(place_order, format: :json)
