Rails.application.routes.draw do
  root controller: :rooms, action: :index
  resources :room_messages
  resources :rooms
  devise_for :users
  match '/users', :to => 'users#index',  :as => :users,  :via => :get
  match '/users/:id', :to => 'users#show',   :as => :user, :via => :get
  match '/users/:id' , :to => "users#createUserMessage",  :as => :send_user_message, :via=> :post


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

