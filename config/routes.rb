require 'sidekiq/web'

Rsstweet::Application.routes.draw do
  resources :feeds, except: :edit

  root to: 'home#index'
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  mount Sidekiq::Web, at: '/sidekiq'
end
