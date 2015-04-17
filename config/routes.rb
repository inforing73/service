Rails.application.routes.draw do
  get 'shop_items/new'

  get 'shop_subcategories/new'

  get 'shop_categories/new'

  get 'shop_trees/new'

	resources :repairs
  resources :items
  resources :models
  resources :services
  resources :prices
  resources :news
  resources :catalog_items
  resources :catalog_categories
  resources :sessions, only: [:new, :create, :destroy]

  root 'pages#home'
 
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/contact', to: 'pages#contact', via: 'get'
  match '/admin', to: 'sessions#new', via: 'get', as: :sign_in
  match '/feedback', to: 'pages#feedback', via: 'get', as: :feedback
  match '/callback', to: 'pages#call', via: 'get', as: :callback
  match '/repair_computer', to: 'pages#repair_computer', via: 'get'
  match '/repair_print', to: 'pages#repair_print', via: 'get'
  match '/repair_apple', to: 'pages#repair_apple', via: 'get'
  match '/repair_mobile', to: 'pages#repair_mobile', via: 'get'
  match '/repair_game', to: 'pages#repair_game', via: 'get'
  match '/repair_notebook', to: 'pages#repair_notebook', via: 'get'
  match '/repair_tablet', to: 'pages#repair_tablet', via: 'get'
  match '/payment', to: 'pages#payment', via: 'get'
  match '/pay', to: 'pages#pay', via: 'get', as: :pay
  match '/order', to: 'pages#order', via: 'get'
  match '/order_parts', to: 'pages#order_parts', via: 'post', as: :order_parts
  match '/catalog_items/images/destroy', to: 'catalog_items#destroy_image', via: 'delete', as: :item_destroy_image
  match 'show_picture', to: 'pages#show_picture', via: 'get', as: :show_picture
end
