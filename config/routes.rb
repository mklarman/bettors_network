Rails.application.routes.draw do
  
resources :matchups
resources :tags
resources :selections
resources :posts
resources :comments
resources :probes
resources :secrets


get "team/probes" => "matchups#probes"
get "user/tags" => "tags#search"


 devise_for :users, :controllers => { :registrations => 'users/registrations' }
 devise_scope :user do

 authenticated :user do
  root :to => "posts#index"
 end

 unauthenticated do
  root :to => "devise/sessions#new"
 end

 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

