Rails.application.routes.draw do
  root to: 'restaurants#index'

  scope except: [:edit, :patch, :destroy] do
    resources :restaurants do
      resources :reviews, only: [ :new, :create ]
    end
  end
  resources :reviews, only: [ :destroy ]
  # Same thing as:
  # get 'restaurants', to: 'restaurants#index', as: :restaurants
  # get 'restaurants/new', to: 'restaurants#new', as: :new_restaurant
  # get 'restaurants/:id', to: 'restaurants#show', as: :restaurant
  # post 'restaurants', to: 'restaurants#create'
  # get 'restaurants/:restaurant_id/reviews/new', to: 'reviews#new', as: :new_restaurant_review
  # post 'restaurants/:restaurant_id/reviews'

  # Excluding because it is not needed:
  # get 'restaurants/:id/edit', to: 'restaurants#edit', as: :edit
  # patch 'restaurants/:id', to: 'restaurants#update'
  # delete 'restaurants/:id', to: 'restaurants#destroy', as: :destroy

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
