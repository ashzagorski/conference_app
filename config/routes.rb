Rails.application.routes.draw do
  namespace :api do
    get '/speakers' => 'speakers#index_speakers'
    post '/speakers' => 'speakers#create_speakers'
    get '/speakers/:id' => 'speakers#show_speakers'
    patch '/speakers/:id' => 'speakers#update_speakers'
    delete '/speakers/:id' => 'speakers#destroy_speakers'
    get '/meetings' => 'meetings#index'
    post '/meetings' => 'meetings#create'
    get '/meetings/:id' => 'meetings#show'
    patch '/meetings/:id' => 'meetings#update'
    delete '/meetings/:id' => 'meetings#destroy'
  end
end
