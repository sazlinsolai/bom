ActionController::Routing::Routes.draw do |map|
  map.resources :deliveries

  map.resources :product_infos

  map.resources :billmaterials, :collection => { :bomlist => :get, :index2 => :get}

  map.resources :products

  map.index '/', :controller => 'home', :action => 'index'

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
