Rails.application.routes.draw do
  root 'photos#index'

  resources :graduates
  resources :grad_years do
    resources :graduates
  end
  resources :photos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
