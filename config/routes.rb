Rails.application.routes.draw do
  devise_for :users
  get "dashboards", to: "dashboards#show"
  root to: 'pages#home'
  resources :events do
    resources :invitations, only: [:index, :create, :update ]
    resources :messages, only: :create
  end
  resources :invitations, only: [:destroy]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
