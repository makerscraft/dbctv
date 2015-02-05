json.array!(@slides) do |slide|
  json.extract! slide, :id, :description, :path, :end_date
  json.url slide_url(slide, format: :json)
end
