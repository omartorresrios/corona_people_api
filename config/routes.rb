Rails.application.routes.draw do
  # devise_for :users
	namespace :users do
    post 'signup' => 'registrations#create'
    post 'signin' => 'sessions#create'
  end

	get 'get_current_user' => 'admin_home#get_user'
	get 'check_admin' => 'admin_home#is_admin'
	post 'admin_register_user' => 'admin_home#create'
  get 'all_citizens' => 'home#all_citizens'

end
