json.array!(@mp3s) do |mp3|
  json.extract! mp3, :title
  json.url mp3_url(mp3, format: :json)
end
