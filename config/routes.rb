Rails.application.routes.draw do
  namespace :api do
    get '/speakers' => 'speakers#index_speakers'
    post '/speakers' => 'speakers#create_speakers'
    get '/speakers/:id' => 'speakers#show_speakers'
    patch '/speakers/:id' => 'speakers#update_speakers'
    delete '/speakers/:id' => 'speakers#destroy_speakers'
    get '/meeting' => 'speakers#index'
    post '/meeting' => 'speakers#create'
    get '/meeting/:id' => 'speakers#show'
    patch '/meeting/:id' => 'speakers#update'
    delete '/meeting/:id' => 'speakers#destroy'
  end
end
