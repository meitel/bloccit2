class User < ActiveRecord::Base
   # #2
   before_save { self.email = email.downcase }
   before_save { self.name = self.name.split.map!{|n| n.capitalize}.join(' ') if self.name }

 # #3
   EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   NAME_REGEX = /\A[A-Z]\w+(\s[A-Z]\w+)?\z/

 # #4
  validates :name, length: { minimum: 1, maximum: 100 }, format: { with: NAME_REGEX }, presence: true
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


end