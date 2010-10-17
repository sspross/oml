class Title < ActiveRecord::Base
  
  belongs_to :language
  
  validates_presence_of :name, :language
  
end
