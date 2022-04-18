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
  root 'photos#index'
  post 'photos/confirm', to: 'photos#confirm'
  
  #letter_openerのルーティング
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  #お気に入りのルーティング
  resources :favorites, only: [:create, :destroy, :index]
end
