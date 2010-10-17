class Tag < ActiveRecord::Base
  
  belongs_to :image
  
  translates :name
  
  validates_presence_of :name
  
end
