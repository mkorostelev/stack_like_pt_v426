class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true

  validates :token, uniqueness: true

  has_many :likes

  has_many :comments

  has_many :posts, foreign_key: 'author_id'
end
