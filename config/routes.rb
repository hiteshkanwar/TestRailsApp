Rails.application.routes.draw do



  resource :users, only: [] do 
    member do
      post :update
    end
  end
  get 'users/index'
  delete 'users/delete'
  post 'users/create'

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
