constraints Api::Subdomain do
  namespace :api, path: ENV['DOMAIN'] == 'app.xyz.com' ? nil : 'api', defaults: { format: :json } do
    get '/' => "api#index"
    namespace :v1 do
      resources :cars, only: [:show]
    end
  end
end
