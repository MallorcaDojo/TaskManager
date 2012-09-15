class User < ActiveRecord::Base
  attr_accessible :birthday, :firstname, :lastname, :email, :password, :password_confirmation
  
  has_many :tasks
  has_and_belongs_to_many :projects
  
  has_secure_password
  validates_presence_of :password, :on => :create
end
