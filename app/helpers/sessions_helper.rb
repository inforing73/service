module SessionsHelper

   def admin?
   	if cookies[:remember_token] == '7459ggcp231pgcd90DS'
   	  true
   	else
   	  false
   	end
   end


end
