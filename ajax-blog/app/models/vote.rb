class Vote < ActiveRecord::Base
  belongs_to :post
  belongs_to :voter, class_name: :User
end
