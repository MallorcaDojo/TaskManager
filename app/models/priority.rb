class Priority < ActiveEnum::Base
  value :id => 1, :name => 'High'
  value :id => 2, :name => 'Middle'
  value :id => 3, :name => 'Low'
  value :id => 4, :name => 'Lowest'
end