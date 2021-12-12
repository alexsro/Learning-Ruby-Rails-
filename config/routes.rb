# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :admins
  authenticate :admin do
    namespace :admins do
      root to: 'dashboard#index'
    end
    resources :posts do
      resources :comments, only: :create
    end
  end
end
