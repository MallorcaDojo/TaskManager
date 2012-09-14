class User < ActiveRecord::Base
  attr_accessible :birthday, :firstname, :lastname
end
