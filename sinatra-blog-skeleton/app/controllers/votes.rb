post '/comments/:comment_id/votes' do
	votable = Comment.find_by(id: params[:comment_id])
	if params[:value] == 'up'
		value = 1
	else
		value = -1
	end
	if request.xhr?
		p "hi"
	else
		cast_vote(votable, value)
	end
end

post '/posts/:post_id/votes' do
	votable = Post.find_by(id: params[:post_id])
	if params[:value] == 'up'
		value = 1
	else
		value = -1
	end
	cast_vote(votable, value)
	if request.xhr?
		response = votable.vote_sum
		content_type :json
		response.to_json
	end
end