class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :voter, class_name: 'User'

  validates :voter_id, :votable_id, :votable_type, presence: true
  # validates :voter_id, uniqueness: { scope: [:votable_id, :votable_type] }
end
