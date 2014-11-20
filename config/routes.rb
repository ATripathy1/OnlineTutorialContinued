OnlineETutorial::Application.routes.draw do
  get "programs/new"
  #get "students/new"
  # The resources keyword allows for the creation of all required RESTful actions
  resources :students

  #Adding Sessions routes, No Edit or Update!! This is a Sessions Controller!!
  resources :sessions, only: [:new, :create, :destroy]

  #Adding Programs routes
  resources :programs

  #get "students/new"
  root 'static_pages#home'
  match '/register',  to:'students#new',          via: 'get'
  match '/signon',    to:'sessions#new',          via: 'get'
  match '/signoff',   to:'sessions#destroy',      via: 'delete'
  match '/help',      to:'static_pages#help',     via: 'get'
  match '/about',     to:'static_pages#about',    via: 'get'
  match '/contact',   to:'static_pages#contact',  via: 'get'
# match '/programs',  to:'static_pages#programs', via: 'get'
  
#  get "static_pages/help"
#  get "static_pages/about"
#  get "static_pages/contact"
#  get "static_pages/programs"

end
