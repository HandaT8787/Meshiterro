Rails.application.routes.draw do
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create, :show, :edit, :update], path_names: {new: 'sign_up'}
  resource :session
  resources :passwords, param: :token
  root to: "homes#top"

  get 'about' => 'homes#about'
  get "up" => "rails/health#show", as: :rails_health_check
end
