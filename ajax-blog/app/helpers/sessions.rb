helpers do
	def auth_user
		@auth_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		true if auth_user
	end

	def authenticate!
		redirect '/users/new' unless logged_in?
	end

	def locked_obj(obj)
		authenticate!
		redirect '/404' unless obj.author_id == auth_user.id
	end
end