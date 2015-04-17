class CatalogCategoriesController < ApplicationController
	add_breadcrumb "Каталог", :catalog_categories_path, :only => %w(index show)

	def new
		@category = CatalogCategory.new
		respond_to do |format|
			format.js
		end
	end

	def create 
	 @category = CatalogCategory.new(category_params) 
	 @categories = CatalogCategory.all
   if @category.save
    respond_to do |format|               
      format.js
    end 
   end
	end

	def edit
		@category = CatalogCategory.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def update
		@category = CatalogCategory.find(params[:id])
    @category.update_attributes(category_params)
    @categories = CatalogCategory.all
    respond_to do |format|
			format.js
		end
	end

	def destroy
		@category = CatalogCategory.find(params[:id])
		@categories = CatalogCategory.all
		@category.destroy
		respond_to do |format|
			format.js
		end
	end

	def index
		@repairs = Repair.all
    @news = News.order('created_at DESC').first(3)
    @items = CatalogItem.all.paginate(page: params[:page], per_page: 12)
		@categories = CatalogCategory.all
	end

	def show
		@repairs = Repair.all
    @news = News.order('created_at DESC').first(3)
		@category = CatalogCategory.find(params[:id])
		@items = @category.catalog_items.paginate(page: params[:page], per_page: 12)
		add_breadcrumb @category.title, catalog_category_path(@category)
	end

	def category_params
      params.require(:catalog_category).permit(:title, :description, :image)
  end
end
