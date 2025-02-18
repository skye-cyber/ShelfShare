Rails.application.routes.draw do
  resources :books do
    resources :loans, only: [:new, :create, :return]
  end

  root "books#index"
end
