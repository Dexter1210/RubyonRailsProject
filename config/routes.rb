Rails.application.routes.draw do
 
  resources :categories
  resources :tags
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 # root to: "home#index"
 root "home#index"
  get 'home/index'
  get 'home/ok'
  get 'home/about', as: :about #about_path or about_url (url aliasing)
  get 'home/contact', as: :contact
end
