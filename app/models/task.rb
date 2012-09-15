class Task < ActiveRecord::Base
  attr_accessible :deadline, :description, :name, :priority
  
  belongs_to :status
  has_many :comments
end