Rails.application.routes.draw do
  root to: "cocktails#index"
  resources :cocktails, only: [:index, :new, :show, :create]
end
