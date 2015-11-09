module ApplicationHelper
		def current_user
  		session[:id] ? User.find(session[:id]) : nil
  	end
end
