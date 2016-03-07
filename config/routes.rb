Rails.application.routes.draw do
  
  resources :lists do
    resources :list_items do
      member do
        patch :complete
      end
    end
  end
    
  root "lists#index"

end
