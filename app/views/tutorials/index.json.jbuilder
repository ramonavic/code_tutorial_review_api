json.array!(@tutorials) do |tutorial|
  json.extract! tutorial, :id, :title, :description, :link, :user, :review
  json.url tutorial_url(tutorial, format: :json)
end
