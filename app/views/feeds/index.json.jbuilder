json.array!(@feeds) do |feed|
  json.extract! feed, :id, :url, :title, :last_modified
  json.url feed_url(feed, format: :json)
end
