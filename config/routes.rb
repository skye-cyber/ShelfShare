Rails.application.routes.draw do
  resources :books do
    resources :loans, only: [:new, :create, :destroy] do
      member do
        patch :return
      end
    end
  end

  root "books#index"
end
