Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :features, only: [:index, :show] do
      resources :comments, only: [:create, :index]
    end
    resources :comments, only: [:destroy]
  end
end

