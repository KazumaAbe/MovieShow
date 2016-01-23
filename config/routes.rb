Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'top#index'

  devise_for :users, controllers: {
  sessions:       "users/sessions",
  registrations:  "users/registrations",
  passwords:      "users/passwords"
}

  resources :user, only: :show
  resources :proto, only: [:new, :index]

end
