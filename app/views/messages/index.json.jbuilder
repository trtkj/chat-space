json.array! @messages do |message|
  json.user_name message.user.name
  json.updated_at(message.updated_at.strftime('%Y/%m/%d %H:%M'))
  json.(message, :body)
  json.image message.image.url
end
