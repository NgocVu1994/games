Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root "static_pages#home"
  resources :games
  resources :messages

  namespace :admin do
    resources :users
    resources :games do
      resources :versions
    end
    resources :messages
  end

end
