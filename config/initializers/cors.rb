class TutorialReviewApi::Application
  config.middleware.insert_before 0,  "Rack::Cors", debug: true, logger: (-> { Rails.logger }) do
    allow do
      origins 'localhost:3000', '127.0.0.1:3000'

      resource '/cors',
        headers: :any,
        methods: :sny,
        credentials: true,
        max_age: 0

      resource '*',
        headers: :any,
        methods: :any,
        max_age: 0
    end
  end
end
