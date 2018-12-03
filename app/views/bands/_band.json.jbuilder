json.extract! band, :id, :description, :genres, :user_id, :created_at, :updated_at
json.url band_url(band, format: :json)
