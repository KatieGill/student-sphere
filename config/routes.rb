Rails.application.routes.draw do
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    registrations: 'admin_users/registrations',
    passwords: 'admin_users/passwords'
  }
  resources :blogs
  resources :projects
  resources :courses
  get 'students/test'
  
  # resources :students do
  #   member do
  #     get :personal_details
  #   end
  #   collection do 
  #     get :active
  #   end
  # end
    #get :active, on: :collection  use whenonly need one collection action
    #get :personal_details, on: :member   use when only need one member action
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'welcome/about'
  #http://localhost:3000/welcome/about
  get '/about' => 'welcome#about'
  #http://localhost:3000/about

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'welcome#index'

  # scope module: :admin do
  #   resources :students
  # end

   # scope :admin do
  #   resources :students
  # end
  #adds admin prefix but points to contorller file not admin folder
  
  namespace :admin do
    resources :students, :projects, :blogs
    resources :courses do
      resources :courses_students,
      only: [:new, :create]
    end
    get 'dashboard' => 'dashboard#index'
  end
end
