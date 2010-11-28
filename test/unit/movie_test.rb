require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  
  context "A movie" do
    setup do
       @movie = Factory(:movie)
       @user = Factory(:user)
       @rating = Factory(:rating, :user => @user, :value => 5)
    end
    
    should "have not any ratings first" do
      assert_does_not_contain @movie.ratings, @rating
      assert_equal @movie.ratings.size, 0
      assert_contains @user.ratings, @rating
    end
    
    should "can get rated" do
      @movie.ratings << @rating
      @movie.save!
      
      assert_contains @movie.ratings, @rating
      assert_equal @movie.ratings.size, 1
      assert_equal @rating.movie, @movie
      assert_equal @movie.rating_all, 5
      assert_equal @movie.rating_friends_of(@user), nil
    end
  end

end
