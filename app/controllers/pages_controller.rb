class PagesController < ApplicationController
  def home
  	@repairs = Repair.all
    @news = News.order('created_at DESC').first(3)
  end

  def contact
  	@repairs = Repair.all
  	add_breadcrumb "Контакты", :contact_path
    @news = News.order('created_at DESC').first(3)
  end

  def feedback
  	unless params[:name].blank? or params[:email].blank? or params[:text].blank? 
  		Mailer.feedback(params[:name],params[:email],params[:text]).deliver
      flash[:success] = "Сообщение отправлено"
    else
      flash[:danger] = "Проверьте заполнены ли поля"
    end
    respond_to do |format|
    	format.js
    end
  end

  def call
    unless params[:phone].blank?
      Mailer.call(params[:phone]).deliver
      flash[:success] = "Запрос отправлен"
    else
      flash[:danger] = "Введите ваш телефон"
    end
    redirect_to :back
  end

  def payment
    @repairs = Repair.all
    add_breadcrumb "Предоплата", :payment_path
    @news = News.order('created_at DESC').first(3)
  end

  def pay
    unless params[:value].blank?
      @value = params[:value].to_i + (params[:value].to_i / 20) + 15
    end
    respond_to do |format|
      format.js
    end
  end

  def order
    @repairs = Repair.all
    add_breadcrumb "Заказ запчастей", :payment_path
    @news = News.order('created_at DESC').first(3)
  end

  def order_parts
    unless params[:name].blank? or params[:contacts].blank? or params[:description].blank?
      images = []
      unless params[:images].blank?  
        params[:images].first(3).each do |image|
          images << AttachedImage.create(image: image)
        end
      end    
      Mailer.order_parts(params[:name],params[:contacts],params[:description],images).deliver
      flash[:success] = "Заказ отправлен"
    else
      flash[:danger] = "Проверьте заполнены ли поля"
    end
    respond_to do |format|
      format.js
    end
  end

  def show_picture
    @image_url = params[:image]
    respond_to do |format|
      format.js
    end
  end

  def repair_computer
    redirect_to repair_path(3)
  end

  def repair_print
    redirect_to repair_path(7)
  end

  def repair_apple
    redirect_to repair_path(2)
  end

  def repair_mobile
    redirect_to repair_path(2)
  end

  def repair_game
    redirect_to repair_path(6)
  end

  def repair_notebook
    redirect_to repair_path(4)
  end

  def repair_tablet
    redirect_to repair_path(5)
  end
end
