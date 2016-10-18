get '/posts' do
	@posts = Post.all
	erb :'posts/index'
end

get '/posts/new' do
	erb :'posts/new'
end

get '/posts/:id' do
	@post = Post.find_by(id: params[:id])

	erb :'posts/show'
end

post '/posts' do
	post = Post.new(title: params[:post][:title], content: params[:post][:content], author_id: auth_user.id)

	if post.save
		redirect "/posts/#{ post.id }"
	else
		@errors = post.errors.full_messages

		erb :'posts/new'
	end
end

delete '/posts/:id' do
	author_id = Post.find_by(id: params[:id]).author.id
	redirect '/' if author_id != auth_user.id

	Post.find_by(id: params[:id]).delete

	redirect '/'
end


