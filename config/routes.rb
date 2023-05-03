Rails.application.routes.draw do

  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to: 'homes#top'
    get 'customers/my_page',to: 'customers#show'
    get 'customers/infomation/edit',to: 'customers#edit'
    patch 'customers/information',to: 'customers#update'
    get 'customers/confirm',to: 'customers#confirm'
    patch 'customers/withdraw',to: 'customers#withdraw'
  end
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to: 'customers#index'
    resources :spaces, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :destroy]
    resources :tags, only: [:index, :create, :edit, :update, :destroy]
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
