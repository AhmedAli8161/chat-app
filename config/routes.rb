Rails.application.routes.draw do
  root controller: :rooms, action: :index
  resources :room_messages do
    member do
      post :create_message_for_bot
    end
  end
  resources :rooms
  devise_for :users
  match '/users', :to => 'users#index',  :as => :users,  :via => :get
  match '/users/:id', :to => 'users#show',   :as => :user, :via => :get
  match '/users/:id' , :to => "users#createUserMessage",  :as => :send_user_message, :via=> :post
  # match 'message_to_bot', to: 'room_messages#create_message_for_bot', via: :all
  namespace 'api' do
    namespace 'v1' do
      resources :wit_messages
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

