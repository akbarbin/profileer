json.extract! phone, :id, :number, :status, :format, :country, :location,
  :phone_type, :carrier, :created_at, :updated_at
json.url api_v1_phone_url(phone, format: :json)
