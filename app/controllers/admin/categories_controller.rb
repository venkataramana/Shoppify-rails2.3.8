class Admin::CategoriesController < ApplicationController
        before_filter :loggedin?
        auto_complete_for :category, :category_name
        def index
                @categories=Category.paginate :page => params[:page], :per_page => 3, :conditions => ["category_name like ?","#{params[:search]}%"]
        end
        def new
                @category=Category.new
        end
        def create
                @category=Category.new(params[:category])
                if @category.save
                        redirect_to "/admin/categories"
                else
                        render :action=> "new"
                end
        end

         def auto_complete_for_category_category_name
                name = params[:category][:category_name]
                @categories = Category.find(:all,:conditions => ['category_name LIKE ?', "#{name}%"])
                #@customers = Customer.search_by_name(params[:customer][:name])
                render :partial => "auto"
        end


        def edit
                @category=Category.find(params[:id])
        end
        def update
                @category=Category.find(params[:id])
                @category.update_attributes(params[:category])
                redirect_to "/admin/categories"
        end
        def destroy
                @category=Category.find(params[:id])
                @category.destroy
                redirect_to "/admin/categories"
        end
        def product_listing
                   @products = Product.paginate :page => params[:page], :per_page => 3, :conditions => ['category_id =?', params[:id]]
                  # @products = Product.find(:all, :conditions => ['category_id =?', params[:id]])
        end
        def loggedin?
                        redirect_to "/sessions" if session[:user_id].nil?
        end

end

