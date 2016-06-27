Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root "static_pages#home"
  resources :games
  resources :messages do
    resources :versions
  end

  namespace :admin do
    resources :games do
      resources :versions
    end
    resources :messages
  end

end
