Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  devise_for :users
  root 'bookmarks#index'

  namespace :api do
    resources :users, only: %i[create]
    resources :bookmarks, only: %i[index]
  end
end
