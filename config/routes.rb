Rails.application.routes.draw do
  devise_for :users

  resources :books, except: [:new]
  get 'books/edit'
  resources :users, except: [:new]
  root to: "homes#top"
  get "/home/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
