Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: %w[index show new create] do
    resources :doses, only: %w[new create destroy], shallow: true
  end
end
