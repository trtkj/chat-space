json.user_name @message.user.name
json.(@message, :updated_at, :body)
json.image @message.image.url
