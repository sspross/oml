class Rating < ActiveRecord::Base
  validates_presence_of :value
  validates_numericality_of :value, :only_integer => true
  validates_associated :user, :movie
  validates_inclusion_of :value, :in => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  validates_uniqueness_of :movie_id, :scope => :user_id
  
  belongs_to :user
  belongs_to :movie
end
