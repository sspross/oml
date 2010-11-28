class Movie < ActiveRecord::Base
  translates :title, :description
  
  has_many :ratings
  has_many :users, :through => :ratings
  
  validates_presence_of :title
  validates_uniqueness_of :title
  
  def rated_by?(user)
    self.users.include?(user)
  end
  
  def rating_all
    self.ratings.sum
  end
  
  def rating_friends(user)
    self.ratings.sum
  end
  
end
