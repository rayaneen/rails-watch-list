Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, only: [ :index, :show, :new, :create ] do
    resources :bookmarks, only: [ :index, :show, :new, :create]
    resources :movies, only: [ :index, :show]
  end
  resources :bookmarks, only: [ :destroy ]
end
