Rails.application.routes.draw do
  root to: "cocktails#index"
  resources :cocktails, except: [:index, :show] do
  end
  resources :cocktails, only: [:show] do
    resources :doses, only: [:create]
    resources :reviews, only: [:create]
  end
end
