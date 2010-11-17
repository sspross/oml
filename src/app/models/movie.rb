class Movie < ActiveRecord::Base
  translates :title, :description
  validates_presence_of :title
end
