json.extract! post, :id, :title, :contents, :is_private, :created_at, :updated_at
json.url post_url(post, format: :json)
