class User < ActiveRecord::Base
  attr_accessible :birthday, :firstname, :lastname
  
  has_many :tasks
  has_and_belongs_to_many :projects
end
