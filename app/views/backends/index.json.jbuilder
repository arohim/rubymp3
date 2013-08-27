json.array!(@backends) do |backend|
  json.extract! backend, :title, :artist, :album, :cover, :mp3file
  json.url backend_url(backend, format: :json)
end
