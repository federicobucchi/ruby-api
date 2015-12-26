Rails.application.routes.draw do
  # Api definition
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :members, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
