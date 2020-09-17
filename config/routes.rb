Rails.application.routes.draw do


  
  devise_for :users

  post "home/comments/:post_id",to: "home#comments", as: :comments
  get "home/search",to: "home#search",:as => :post_search
  get "home/read/:id",to: "home#read", :as => :post_read
  get "home/:tag/posts", to: "home#tag_search", :as => :tag_search
  get "home/:category/post", to:"home#category_search", :as => :category_search
  get "home/:comment/comments", to:"home#comment_search", :as => :comment_search
 
  resources :posts
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
