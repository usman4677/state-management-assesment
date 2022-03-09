Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth/users'

  namespace :api do
    namespace :v1 do
      resources :vehicals, param: :key, only: [:index, :show, :destroy, :create, :update]
    end
  end
end
