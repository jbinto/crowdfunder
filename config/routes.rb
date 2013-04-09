CrowdfunderInClass::Application.routes.draw do
  root :to => 'home#home'
  resources :projects
end
