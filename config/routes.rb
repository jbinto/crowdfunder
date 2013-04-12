CrowdfunderInClass::Application.routes.draw do
  root :to => 'home#home'
  resources :projects, only: ['index', 'show'] do
    resources :pledges, only: ['new', 'create']
  end
  
  resources :users, only: ['new', 'create']

  get '/sign-in' => 'sessions#new', as: "sign_in"
  resource :session, only: ['create', 'destroy']

  namespace :my do
    resources :projects, except: ['show']
  end
end
