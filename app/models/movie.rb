class Movie < ActiveRecord::Base
  translates :title, :description
  validates_presence_of :title
  has_many :ratings
  has_many :users, :through => :ratings
  
  def rated_by?(user)
    self.users.include?(user)
  end
  
end
