Rails.application.routes.draw do

  resources :labels

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  #マイページのルーティング。必ずdevise設定の下に！
  resources :users, only: [:show, :edit, :update]

  resources :photos do
    resources :comments
  end
  root 'photos#index'
  post 'photos/confirm', to: 'photos#confirm'
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # get '/', to: 'tasks#index'
end
