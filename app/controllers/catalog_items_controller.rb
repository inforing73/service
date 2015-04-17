class CatalogItemsController < ApplicationController
	add_breadcrumb "Товары", :catalog_categories_path, :only => %w(show)

  def new
		@item = CatalogItem.new
    @category_id = params[:category_id]
		respond_to do |format|
			format.js
		end
	end

	def create 
	 @item = CatalogItem.new(item_params) 
	 @items = CatalogCategory.find(item_params[:catalog_category_id]).catalog_items.paginate(page: params[:page], per_page: 10)
   	 @category = CatalogCategory.find(item_params[:catalog_category_id])
   if @item.save
      unless params[:images].blank?  
        params[:images].first(5).each do |image|
          @item.attached_images.create(image: image)
        end
      end  
   end
    respond_to do |format|               
      format.js
   	end 
	end

	def edit
		@item = CatalogItem.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def update
		@item = CatalogItem.find(params[:id])
		@items = @item.catalog_category.catalog_items.paginate(page: params[:page], per_page: 10)
    @category = @item.catalog_category
    @item.update_attributes(item_params)
    unless params[:images].blank?  
      params[:images].first(5).each do |image|
        @item.attached_images.create(image: image)
      end
    end  
    respond_to do |format|
			format.js
		end
	end

	def destroy
		@item = CatalogItem.find(params[:id])
		@category = @item.catalog_category
		@items = @item.catalog_category.catalog_items.paginate(page: params[:page], per_page: 10)
		@item.destroy
		respond_to do |format|
			format.js
		end
	end

	def destroy_image
		@image = AttachedImage.find(params[:image_id])
		@item = @image.catalog_item
		@image.destroy
		respond_to do |format|
			format.js
		end
	end

	def show
    @item = CatalogItem.find(params[:id])
    @repairs = Repair.all
    @news = News.order('created_at DESC').first(3)
    add_breadcrumb @item.title, catalog_item_path(@item)
	end

	def item_params
      params.require(:catalog_item).permit(:title, :description, :price, :catalog_category_id, :article)
  end
end
