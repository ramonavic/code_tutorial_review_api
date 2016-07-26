json.extract! @tutorial, :id, :created_at, :updated_at, :reviews, :user
json.url tutorial_url(tutorial, format: :json)
