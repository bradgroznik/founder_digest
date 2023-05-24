Rails.application.routes.draw do
  root 'pages#home'
  get 'apply', to: 'pages#apply'
  get 'start', to: 'pages#start' #new user onboarding 

  devise_for :users
  get 'logout', to: 'pages#logout', as: 'logout'

  resources :subscribe, only: [:index]
  get 'dashboard', to: 'dashboard#index'
  
  get 'stakeholder_updates/new', to: "stakeholder_updates#new"
  
  resources :account, only: [:index, :update]
  resources :billing_portal, only: [:create]
  match '/billing_portal' => 'billing_portal#create', via: [:get]
  match '/cancel' => 'billing_portal#destroy', via: [:get]

  resources :user_submissions, only: [:create]


  # static pages 
  pages = %w(
    privacy terms
  )
  
  pages.each do |page|
    get "/#{page}", to: "pages##{page}", as: "#{page.gsub('-', '_')}"
  end

  namespace :admin do
    get '/', to: 'pages#dashboard' 
  end

  

end
