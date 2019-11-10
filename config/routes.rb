Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index] do
    collection do
      get :actors
    end
  end
  resources :reviews, only: [:index]
end
