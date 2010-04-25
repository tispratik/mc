ActionController::Routing::Routes.draw do |map|
  # registration and login
  map.resource :registration, :only => [:new, :create, :edit, :update, :destroy], :as => :users,
      :path_names => {:new => :sign_up}, :member => {:validate => :post}, :collection => {:regions => :get, :cities => :get}
  
  map.with_options(:controller => 'user_sessions', :name_prefix => nil) do |session|
    session.new_user_session     "sign_in",  :action => :new, :conditions => {:method => :get}
    session.user_session         "sign_in",  :action => :create, :conditions => {:method => :post}
    session.destroy_user_session "sign_out", :action => :destroy, :conditions => {:method => :get}
  end
  
  map.resources :organizations do |users|
    map.resources :users
    map.resources :teams
    map.resources :team_users
    map.resources :msocials
    map.resources :mcontacts
    map.resources :accesses
  end
  
  map.root :controller => :users, :action => :me
  
end
