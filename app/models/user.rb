class User < ActiveRecord::Base
   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :votes, dependent: :destroy
   has_many :favorites, dependent: :destroy
   # #2
   before_save { self.email = email.downcase }
   before_save { self.role ||= :member }
 # #3
   EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

 # #4
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
 # #5
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
 # #6
  validates :email,
             presence: true,
             uniqueness: { case_sensitive: true },
             length: { minimum: 3, maximum: 100 },
             format: { with: EMAIL_REGEX }

 # #7
   has_secure_password
   
   enum role: [:member, :admin]

   def favorite_for(post)
     favorites.where(post_id: post.id).first
   end
end
