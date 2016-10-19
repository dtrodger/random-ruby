
post '/posts/:id/vote' do
  post = Post.find(params[:id])
  vote = post.votes.new(value: 1)
  if request.xhr?
  	if vote.save
  	  response = {num_votes: post.votes.length}
  	  content_type :json
  	  response.to_json
	  else
  	  response = {errors: vote.errors.full_messages}
  	  content_type :json
  	  response.to_json
  	end
  else
  	if vote.save
  		redirect "/posts"
  	else
  		@errors = vote.errors.full_messages

  		erb :'posts/index'
  	end
  end
end
