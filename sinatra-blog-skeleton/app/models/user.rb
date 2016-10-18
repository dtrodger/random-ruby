require 'bcrypt'

class User < ActiveRecord::Base
  validates :username, :email, :password_hash, presence: true
  
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :votes, foreign_key: :voter_id

  def password
  	@password ||= BCrypt::Password.new(self.password_hash)
  	@password
  end

  def password=(new_password)
  	self.password_hash = BCrypt::Password.create(new_password)
  end

  def authenticate(plain_text_password)
  	p "HIHIIHIHIHIHI"
  	p password
  	p plain_text_password
  	password == plain_text_password
  end
end
