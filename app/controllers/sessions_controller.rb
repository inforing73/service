class SessionsController < ApplicationController
	def new
		@repairs = Repair.all
  end 

	def create
    cookies.permanent[:remember_token] = '7459ggcp231pgcd90DS' if params[:password] == "310370"
    redirect_to root_url
  end

  def destroy
    cookies.delete(:remember_token)
    redirect_to root_url
  end

end
