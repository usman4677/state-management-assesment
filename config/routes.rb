Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth/users'

  namespace :api do
    namespace :v1 do
      get 'transitions' => 'vehicals#get_transitions'
      post 'update-transitions' => 'vehicals#update_transitions'
      # post 'state-transition/:id' => 'vehicals#state_transition'
      resources :vehicals, param: :key, only: [:index, :show, :destroy, :create, :update] do
        member do
          post 'state-transition' => 'vehicals#state_transition'
        end
      end
    end
  end
end
