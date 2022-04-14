Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :photos
  root 'photos#index'
  post 'photos/confirm', to: 'photos#confirm'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # get '/', to: 'tasks#index'
end
