Schadenfreude::Application.routes.draw do
  get "users/new"
  resources :users


    match ':controller(/:action(/:id(.:format)))'
		root :to => redirect('/new')
end
