helpers do
	def cast_vote(votable, value)
		voter = auth_user
		vote = Vote.new(value: value, voter: voter, votable: votable)
		if vote.save
			status 200
			return votable.vote_sum.to_s if request.xhr?
			redirect request.referer
		else
			return 500 if request.xhr?
			redirect request.referer
		end
	end
end