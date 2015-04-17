class ServicesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    respond_to do |format|               
      format.js
    end 
  end


  def create
    @service= Service.new(title: params[:title]) 
    @item = Item.find(params[:item_id])
    @services = @item.services
    @repair = @item.repair
    @items = @repair.items
    if @service.save
      unless params[:models].nil?
        params[:models].each do |model, cost|
          Price.create(model_id: model.to_i, service_id: @service.id, cost: cost )
        end     
      end
      respond_to do |format|               
        format.js
      end 
    end
  end

  def edit
    @service = Service.find(params[:id])
    @item = Item.find(params[:item_id])
    respond_to do |format|
      format.js
    end
  end 

  def update
    @service = Service.find(params[:id]) 
    @repair = Item.find(params[:item_id].to_i).repair
    @items = @repair.items
    @service.update_attributes(title: params[:title])
    params[:models].each do |model, cost|
      price = Price.find_by(service_id: @service.id, model_id: model.to_i)
      price.update_attributes(cost: cost)
    end
    respond_to do |format|               
      	format.js
    end 
  end

  def destroy
    @repair = Item.find(params[:item_id].to_i).repair
    @items = @repair.items
    @service = Service.find(params[:id])
    @service.destroy
    flash[:success] = "Услуга удалена"
    respond_to do |format|
      format.js
    end
  end

end
