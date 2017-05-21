Rails.application.routes.draw do
	root "artists#index"
	resources :artists do 
		resources :paintings
	end  
	resources :sessions
	get '/login' => "sessions#new"
	post '/login' => "sessions#create"
	delete '/logout' => "sessions#destroy"
end
