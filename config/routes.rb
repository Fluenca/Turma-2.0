Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "dashboards", to: "dashboards#show"
  resources :events do
    resources :invitations, only: [:create, :update, :destroy ]
    resources :messages, only: [:create]
  end
  resources :invitations, only: [:index]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
