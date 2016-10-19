get '/sessions' do
	erb :'sessions'
end

post '/sessions' do
	user = User.find_by(username: params[:user][:username])

	if user.authenticate(params[:user][:password])
		session[:user_id] = user.id

		redirect '/'
	else
		@errors = ['Invalid username or password']

		erb :'sessions'
	end
end

delete '/sessions' do
	session.delete(:user_id)

	redirect '/'
end