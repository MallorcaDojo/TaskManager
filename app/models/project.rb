class Project < ActiveRecord::Base
  attr_accessible :name
  
  has_many :tasks
  has_and_belongs_to_many :users
end
