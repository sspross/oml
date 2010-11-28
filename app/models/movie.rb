class Movie < ActiveRecord::Base
  translates :title, :description
  
  has_many :ratings
  has_many :users, :through => :ratings
  
  def rated_by?(user)
    self.users.include?(user)
  end
  
  def rating_all
    return nil if self.ratings.count < 1
    return (self.ratings.sum(:value).to_f / self.ratings.count.to_f).to_f
  end
  
  def rating_friends_of(user)
    sum = 0
    count = 0
    for friend in user.friends
      if friend.rating_of_movie(self)
        sum += friend.rating_of_movie(self).value
        count += 1
      end
    end
    return nil if count < 1
    return (sum.to_f / count.to_f).to_f
  end
  
end
