json.array! @messages do |message|
  json.user_name message.user.name
  json.(message, :updated_at, :body)
  json.image message.image.url
end
