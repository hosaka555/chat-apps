Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "home" => "application#home",as: :root
  get "signup" => "users#new",as: :signup
  post "signup" => "users#create",as: :create_user

  # login
  get "login" => "sessions#new", as: :login
  post "login" => "sessions#create", as: :create_login
  get "logout" => "sessions#destroy", as: :logout

  get "users/:user_name/mypage" => "mypages#show",as: :mypage
end
