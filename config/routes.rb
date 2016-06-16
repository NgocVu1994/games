Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root "static_pages#home"
  resources :games

  namespace :admin do
    resources :games
  end

end
