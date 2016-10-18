module Votable
	def vote_sum
		self.votes.sum(:value)
	end
end