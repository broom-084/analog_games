Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
  
  scope module: :public do
    devise_for :users
    root to: 'homes#top'
    get 'homes/about', to: 'homes#about', as: :about
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update] do
      get :withdrawal
      post :delete
    end
  end
  
  get 'users/index'
  get 'users/edit'
  get 'users/show'
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root to: 'homes#top'
  #get 'homes/about' => 'homes#about', as: 'about'
  resources :posts
  resources :users
  get "search" => "searches#search"
end
