json.array!(@usernames) do |username|
  json.extract! username, :id, :password_digest
  json.url username_url(username, format: :json)
end
