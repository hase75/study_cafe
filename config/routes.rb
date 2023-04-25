Rails.application.routes.draw do
  
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to: 'homes#top'
    resources :spaces, only: [:index, :new, :create, :show, :edit, :update]
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
