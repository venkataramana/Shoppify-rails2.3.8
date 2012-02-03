class Admin::ProductsController < ApplicationController
        before_filter :loggedin?
        auto_complete_for :product, :product_name, :limit =>2, :order => 'created_at DESC'
        def index
                @products = Product.paginate :page => params[:page], :per_page => 3, :conditions => ["product_name like ?","#{params[:search]}%"]
        end
        def new
                @product=Product.new
        end
        def create
                @product=Product.new(params[:product])
                #@product.kvr = params[:product][:kvr]
                if @product.save
                        redirect_to "/admin/products"
                else
                        render :action=> "new"
                end
        end
         def add_product_to_session
                @product=Product.find(params[:id])
                if session[:product].nil?
                        session[:product] = {}
                        session[:product][@product.id] = {:product_name=>@product.product_name, :description=>@product.description, :price=>@product.price, :quantity=>0}
                end
                if session[:product].has_key?(@product.id)
                        session[:product][@product.id][:quantity]=session[:product][@product.id][:quantity]+1
                else
                        session[:product][@product.id] = {:product_name=>@product.product_name, :description=>@product.description, :price=>@product.price, :quantity=>1}
                end
                redirect_to "/admin/products/product_session"
        end
        def product_session
                #render :text =>session[:product].size.inspect and return false
                @product = Product.new
                #@productids = Product.find(:all, :conditions =>['id IN (?)', session[:product].keys])

                #render :text =>session[:product][:product_id][:quantity].inspect and return false
        end
        def cart_update
                i=0
                params[:new_value].size.times do
                        session[:product][params[:new_value].keys[i].to_i][:quantity] = params[:new_value][params[:new_value].keys[i]].to_i
                i+=1
                end
                #@producting = Product.find(:all,:conditions =>['id IN (?)',session[:product]])
                redirect_to :action => 'product_session'
        end
        def destroy_cart
                 #render :text=>session[:product].inspect and return false
                 #session[:product].delete_if{|i| i == params[:id]}
                 session[:product].delete(params[:id].to_i)
                 redirect_to "/admin/products/product_session"
        end
        def auto_complete_for_product_product_name
                name = params[:product][:product_name]
                @products = Product.find(:all,:conditions => ['product_name LIKE ?', "#{name}%"])
                #@customers = Customer.search_by_name(params[:customer][:name])
                render :partial => "auto"
        end
        def edit
                @product=Product.find(params[:id])
        end
        def update
                @product=Product.find(params[:id])
                @product.update_attributes(params[:product])
                redirect_to "/admin/products"
        end
        def destroy
                @product=Product.find(params[:id])
                @product.destroy
                redirect_to "/admin/products"
        end
        def loggedin?
                        redirect_to "/sessions" if session[:user_id].nil?
        end

end

