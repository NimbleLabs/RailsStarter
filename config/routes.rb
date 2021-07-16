Rails.application.routes.draw do
  get 'admin', to: "admin#index"
  get 'account', to: "account#index"
  devise_for :users, :path_names => {:sign_in => 'sign-in', :sign_up => 'register', :sign_out => 'logout'}
  root to: "home#index"
end
