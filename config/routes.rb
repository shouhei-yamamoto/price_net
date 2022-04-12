Rails.application.routes.draw do
  resources :photos
  post 'photos/confirm', to: 'photos#confirm'
  # get '/', to: 'tasks#index'
end
