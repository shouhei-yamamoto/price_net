Rails.application.routes.draw do
  #ラベルのルーティング
  resources :labels

  #deviseのルーティング
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  #マイページのルーティング。必ずdevise設定の下に！
  resources :users, only: [:show, :edit, :update]
  
  
  #写真のルーティング
  resources :photos do
    resources :comments
  end
 
  post 'photos/confirm', to: 'photos#confirm'
  
  #letter_openerのルーティング
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  #お気に入りのルーティング
  resources :favorites, only: [:create, :destroy, :index]

  #top画面のルーティング
  get "tops/index" => "tops#index"
  root 'tops#index'
  
  post '/tops/guest_sign_in', to: 'tops#guest_sign_in'
  post '/tops/admin_guest_sign_in', to: 'tops#admin_guest_sign_in'
end
