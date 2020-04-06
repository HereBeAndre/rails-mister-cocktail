Rails.application.routes.draw do
  get 'doses/new'
  get 'doses/create'
  get 'doses/delete'
  root to: 'cocktails#index'
  resources :cocktails, only: %i[index new show create] do
    resources :doses, only: %i[new create]
  end

  resources :doses, only: [:destroy]
end
