Rails.application.routes.draw do
  resources :test_results, only: [:show, :index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
