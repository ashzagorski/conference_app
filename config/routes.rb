Rails.application.routes.draw do
  namespace :api do
    get '/speaker_url' => 'speakers#speaker_action'
  end
end
