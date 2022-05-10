Rails.application.routes.draw do
  resources :todo_lists do
    resources :todo_items
  end
  
  namespace :todo_list do
    resources :todo_items
  end
  match "/404", to: "application#not_found", via: :all


  resources :schedules
  devise_for :users , controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :message_boards, only: [:index], as: "message_boards"

  resources :messages do
    resources :comments
  end
  
  root "home#index"
  resources :personals ,only: [:index]
  resources :projects , except:[:index]

  resources :chat_rooms , only:[:show ]
  resources :contents , only:[:create]
  

end
