class Comment < ActiveRecord::Base
  attr_accessible :text
  belongs_to :task
  attr_accessor :task
end
