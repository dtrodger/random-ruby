class Comment < ActiveRecord::Base
  validates :author_id, :content, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :post
  has_many :votes, as: :votable

  include Votable
end
