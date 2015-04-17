class RepairsController < ApplicationController
  add_breadcrumb "Прайс", :repairs_path, :only => %w(index show new)

  def new
  	@repair = Repair.new
    @repairs = Repair.all
    @news = News.order('created_at DESC').first(3)
    add_breadcrumb "Добавление ремонта", :new_repair_path
  end

  def index
    @news = News.order('created_at DESC').first(3)
    @repairs = Repair.all
  end

  def create
  @repair = Repair.new(repair_params) 
  @repairs = Repair.all
  if @repair.save
    flash[:success] = "Прайс создан"
    redirect_to repairs_url
  else
    flash[:error] = @repair.errors.full_messages.join("<br/>").html_safe
    render 'new'
  end
  end

  def show
    @repair = Repair.find(params[:id])
    @repairs = Repair.all
    @items = @repair.items
    @news = News.order('created_at DESC').first(3)
    add_breadcrumb @repair.title, repair_path(@repair)
  end

  def update
   @repair = Repair.find(params[:id])
   @items = @repair.items
   @repair.update_attributes(repair_params)
   respond_to do |format|
    format.js
   end
  end

  def destroy
    @repair = Repair.find(params[:id])
    @repair.destroy
    flash[:success] = "Ремонт удален"
    redirect_to repairs_url
  end


  private

  def repair_params
      params.require(:repair).permit(:title, :description, :bread, :image)
  end

end
