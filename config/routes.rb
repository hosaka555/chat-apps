Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "home" => "application#home"
  get "users/signup" => "users#new",as: :new_user
  post "users/signup" => "users#create",as: :create_user
  get "users/:user_name/mypage" => "mypages#show",as: :mypage
end
