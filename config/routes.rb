Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses
  end
  delete 'doses/:id' => 'doses#destroy'
  root to: 'cocktails#index'
end
