Rails.application.routes.draw do
 
      root :to => "events#index"
    get '/signup' => 'homes#new'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'
    resources :users do
      collection do
        get :forget_password
        patch :change_password
      end
    end
    resources :homes
    resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
