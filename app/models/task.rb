class Task < ActiveRecord::Base
  attr_accessible :deadline, :description, :name, :priority
  has_many :comments
end
