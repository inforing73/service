class ModelsController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    respond_to do |format|               
      format.js
    end
  end

  def create
    @model = Model.new(title: params[:title], item_id: params[:item_id].to_i) 
    @repair = Item.find(@model.item_id).repair
    @items = @repair.items
    if @model.save
 	    unless params[:services].nil?
 	 	  	params[:services].each do |service, cost|
     	 	  Price.create(model_id: @model.id, service_id: service.to_i, cost: cost )
      	end
    	end
      respond_to do |format|               
      	format.js
    	end 
    end
  end

  def edit
    @model = Model.find(params[:id])
    @item = Item.find(params[:item_id])
    respond_to do |format|
      format.js
    end
  end 


  def update
    @model = Model.find(params[:id]) 
    @repair = Item.find(@model.item_id).repair
    @items = @repair.items
    @model.update_attributes(title: params[:title])
    	params[:services].each do |service, cost|
       	price = Price.find_by(service_id: service.to_i, model_id: @model.id)
        price.update_attributes(cost: cost)
      end
      respond_to do |format|               
        	format.js
      end 
  end

  def destroy
    @repair = Item.find(params[:item_id].to_i).repair
    @items = @repair.items
    @model = Model.find(params[:id])
    @model.destroy
    flash[:success] = "Модель удалена"
    respond_to do |format|
      format.js
    end
  end

end
