Schadenfreude::Application.routes.draw do
  resources :users
	#match ':controller(/:action(/:id(.:format)))'
	root :to => "users#main"
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/main', 		to: 'users#main',						via: 'get'
end
