ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  #map.connect "/admin/products/destroy_cart", :controller=> "products", :action=> "destroy_cart"
 # map.auto_complete '/admin/products', :requirements => { :action => /autocompletefor_\S+/ }, :conditions => { :method => :get }
  map.resources :users

  map.resource :session

  # The priority is based upon order of creation: first created -> highest priority.
        #map.connect '/admin/categories/product_listing/:id', :controller => 'products', :action => 'product_listing'


#        map.connect "/admin/products/:id",:controller => 'products',:action => 'add_product_to_session'
        #map.connect '/admin/products/update_session',:controller => 'products',:action => 'update_session'

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products
   map.namespace :admin do |admin|
           admin.resources :categories, :collection=> {:product_listing=>:get, :auto_complete_for_category_category_name=> :get}
           admin.resources :products, :collection=> {:add_product_to_session=>:get, :product_session=> :get, :cart_update=> :get, :destroy_cart=> :get, :auto_complete_for_product_product_name=> :get}
    end

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

