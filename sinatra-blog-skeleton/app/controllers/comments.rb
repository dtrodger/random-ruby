get '/posts/:post_id/comments/new' do
	@post_id = params[:post_id]
	erb :'comments/new'
end

# post '/posts/:post_id/comments' do
# 	comment = Comment.new(author_id: auth_user.id, post_id: params[:post_id], content: params[:content])
# 	if request.xhr?
# 		if comment.save
# 			response = {author: comment.author.username, content:}
# 	if comment.save
# 		redirect "/posts/#{ params[:post_id] }"
# 	else
# 		@errors = comment.errors.full_messages
# 		@post_id = params[:post_id]

# 		erb :'comments/new'
# 	end
# end