class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :ratings
  has_many :friendships
  
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :direct_friends, :through => :friendships, :conditions => ['approved = ?', true], :source => :friend
  has_many :inverse_friends, :through => :inverse_friendships, :conditions => ['approved = ?', true], :source => :user
  has_many :pending_friends, :through => :friendships, :conditions => ['approved = ?', false], :foreign_key => "user_id", :source => :friend
  has_many :requesting_friends, :through => :requested_friendships, :source => :user
  has_many :requested_friendships, :class_name => "Friendship", :foreign_key => "friend_id", :conditions => ['approved = ?', false]
 
  def friends
    direct_friends | inverse_friends
  end
  
  def rating_of_movie(movie)
    self.ratings(:conditions => ['movie_id = ?', movie.id]).first
  end
end
