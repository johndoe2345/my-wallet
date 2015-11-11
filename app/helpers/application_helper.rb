module ApplicationHelper
		def current_user
  		session[:id] ? User.find(session[:id]) : nil
  	end

  	def shared_name(card_owner_id)
  		User.find(card_owner_id).full_name
  	end
end
