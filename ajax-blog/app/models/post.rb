class Post < ActiveRecord::Base
  has_many :votes
  belongs_to :author, class_name: :User

  validates :title, :content, :points, presence: true

  # def points
  #   votes.sum(:value)
  # end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
