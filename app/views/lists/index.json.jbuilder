json.array!(@lists) do |list|
  json.extract! list, :id, :title, :about
  json.url list_url(list, format: :json)
end
