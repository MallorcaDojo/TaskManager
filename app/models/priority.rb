class Priority < ActiveEnum::Base
  value :id => 1, :name => 'Low'
  value :id => 2, :name => 'Middle'
  value :id => 3, :name => 'High'
end