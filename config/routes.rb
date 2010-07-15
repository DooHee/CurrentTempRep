ActionController::Routing::Routes.draw do |map|
#  map.resource :user_session
  map.auth 'auth', :controller => "user_sessions", :action => "new"
#  map.hello 'hello', :controller => 'say', :action => 'hello'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
