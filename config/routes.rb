# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  resources :users, only: %i(show edit update) do
    member do
      get :followings, :followers
    end
  end
  resources :follows, only: %i(create destroy)
  resources :items, only: %i(new create index show destroy) do
    resources :item_comments, only: %i(create destroy)
    resource :favorites, only: %i(create destroy)
  end
  get 'search' => 'items#search'
end
