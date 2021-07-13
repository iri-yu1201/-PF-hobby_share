# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  resources :users, only: [:show, :edit, :update] do
    member do
      get :followings, :followers
    end
  end
  resources :follows, only: [:create, :destroy]
  resources :items, only: [:new, :create, :index, :show, :destroy] do
    resources :item_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    
  end
end
