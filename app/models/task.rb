class Task < ActiveRecord::Base
  attr_accessible :deadline, :description, :name, :priority
end
