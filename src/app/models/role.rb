class Role < ActiveRecord::Base
  
  translates :name, :description
  
  validates_presence_of :name
  
end
