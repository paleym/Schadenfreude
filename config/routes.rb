Schadenfreude::Application.routes.draw do
  resources :users
	#match ':controller(/:action(/:id(.:format)))'
	root :to => redirect('/users/main')
end
