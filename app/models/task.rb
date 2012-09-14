class Task < ActiveRecord::Base
  attr_accessible :deadline, :description, :name, :priority
  
  validates :name, :presence => true
  validates :priority, :presence => true
  
  belongs_to :user
  belongs_to :project
  belongs_to :status
end
