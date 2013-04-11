CrowdfunderInClass::Application.routes.draw do
  root :to => 'home#home'
  resources :projects
  resources :users, only: ['new', 'create']
  get '/sign-in' => 'sessions#new', as: "sign_in"
  resource :session, only: ['create', 'destroy']
end
