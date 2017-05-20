Rails.application.routes.draw do
	root "paintings#index"
	resources :paintings 
	resources :sessions
	get '/login' => "sessions#new"
	post '/login' => "sessions#create"
	delete '/logout' => "sessions#destroy"
end
