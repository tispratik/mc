ActionController::Routing::Routes.draw do |map|
  
  # registration and login
  map.resource :registration, :only => [:new, :create, :edit, :update, :destroy], :as => :users,
      :path_names => {:new => :sign_up}, :member => {:validate => :post}, :collection => {:regions => :get, :cities => :get}
  
  map.with_options(:controller => 'user_sessions', :name_prefix => nil) do |session|
    session.new_user_session     "sign_in",  :action => :new, :conditions => {:method => :get}
    session.user_session         "sign_in",  :action => :create, :conditions => {:method => :post}
    session.destroy_user_session "sign_out", :action => :destroy, :conditions => {:method => :get}
  end
  
  map.resources :users 

  map.resources :organizations do |o|
    o.resources :teams
    o.resources :team_users
    o.resources :msocials
    o.resources :mcontacts
    o.resources :accesses
    o.resources :organization_roles, :as => :roles
    o.resources :assets
    o.connect '/assets/:id/:style', :controller => 'assets', :action => 'show', :conditions => {:method => :get}
  end
  
  map.connect "live_validations/:action", :controller => "live_validations"
  map.resources :comments, :member => {:quote => :get}
  map.root :controller => :users, :action => :me
  
end
