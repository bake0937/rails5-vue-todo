Rails.application.routes.draw do
  resources :todos
  root to: 'home#index'
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :todos
    end
  end
end
