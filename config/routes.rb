Schadenfreude::Application.routes.draw do
  resources :users
	#match ':controller(/:action(/:id(.:format)))'
	root :to => "users#main"
end
