ProjectZero::Application.routes.draw do

  root :to => "home#index"

  scope "/:locale" do
    
    resources :movies
    resources :users
    resources :user_sessions
    
    match '/login', :to => 'user_sessions#new', :as => :login
    match '/logout', :to => 'user_sessions#destroy', :as => :logout
    
    match '/exception_test' => 'exception_test#error'
  end
  
end
