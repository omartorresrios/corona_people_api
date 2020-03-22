Rails.application.routes.draw do
  # devise_for :users
	namespace :users do
    post 'signup' => 'registrations#create'
    post 'signin' => 'sessions#create'
  end

end
