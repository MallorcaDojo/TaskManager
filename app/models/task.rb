class Task < ActiveRecord::Base
  attr_accessible :deadline, :description, :name, :priority
  
  has_many :comments
  belongs_to :status
  belongs_to :user
  belongs_to :project
  
  enumerate :priority, :with => Priority
  
  before_save :set_default
  
  def set_default
    self.priority = 4
  end
end