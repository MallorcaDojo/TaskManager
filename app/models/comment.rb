class Comment < ActiveRecord::Base
  attr_accessible :text
  belongs_to :task
  attr_accessor :task
  validates :text, :presence => true, :length => {:minimum => 10, :message => "Kommentar zu kurz"}
end
