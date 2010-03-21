ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home'
  
  map.resource :user_session
  map.resources :users
  map.resources :tasks
  
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
    

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
