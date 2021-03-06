Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :phones do
        get :validate, on: :collection
      end
      resources :stats, only: [:index]
      resources :users, only: [:create]
    end
  end

  post 'signin', to: 'api/v1/authentication#authenticate'
  delete 'signout', to: 'api/v1/authentication#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
