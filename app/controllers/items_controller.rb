class ItemsController < ApplicationController
  def new
    @item = Item.new
    @repair_id = params[:repair_id].to_i
    respond_to do |format|               
      format.js
    end 
  end

  def create
   @item = Item.new(item_params) 
   @repair = Repair.find(item_params[:repair_id])
   @items = @repair.items
   if @item.save
    respond_to do |format|               
      format.js
    end 
   end
  end

  def edit
    @item = Item.find(params[:id])
    respond_to do |format|
      format.js
    end
  end 

  def update
   @item = Item.find(params[:id]) 
   @repair = Repair.find(params[:repair_id])
   @items = @repair.items
   @item.update_attributes(title: params[:title])
   respond_to do |format|
     format.js
   end
  end

  def destroy
    @item = Item.find(params[:id])
    @repair = @item.repair
    @items = @repair.items
    @item.destroy
    flash[:success] = "Вид ремонта удален"
    respond_to do |format|
      format.js
    end
  end


  private

  def item_params
      params.require(:item).permit(:title, :repair_id)
  end
end
