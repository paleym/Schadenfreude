Schadenfreude::Application.routes.draw do
  resources :wallposts

  resources :users
	#match ':controller(/:action(/:id(.:format)))'
	root :to => "users#main"
  resources :sessions, only: [:new, :create, :destroy]
  resources :search, only: [:new, :index]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/edit_profile', to: 'users#edit',			via: 'get'
  match '/editing', to: 'users#update',					via: 'patch'
  match '/newpost', to: 'wallposts#new',				via: 'get'
  match '/newpost', to: 'wallposts#create',			via: 'post'
  match '/main', 		to: 'users#main',						via: 'get'
  match '/search',	to: 'search#new',						via: 'get'
  match '/search',	to: 'search#index',					via: 'post'
  match '/search_results', to: 'search#index',	via: 'post'
end
