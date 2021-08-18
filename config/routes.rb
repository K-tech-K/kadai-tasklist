Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "tasks#index"
  
  #ログイン機能のルーティング
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
   #ユーザーモデルのルーティング
  resources :users, except: [:index]
  
  #タスクのルーティング
  resources :tasks
  
end
