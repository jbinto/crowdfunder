CrowdfunderInClass::Application.routes.draw do
  root :to => 'home#home'
  resources :projects
  resources :users, only: ['new', 'create']
end
