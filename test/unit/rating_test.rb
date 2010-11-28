require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  
  context "A rating" do
    setup do
      @rating = Factory.build(:rating)
      @silvan = Factory(:user)
      @movie1 = Factory(:movie)
    end
    
    should "need a integer value between 1 and 10" do
      @rating.value = nil
      assert_equal @rating.valid?, false
      @rating.value = "adsf"
      assert_equal @rating.valid?, false
      @rating.value = 0
      assert_equal @rating.valid?, false
      @rating.value = 11
      assert_equal @rating.valid?, false
      @rating.value = 5
      assert_equal @rating.valid?, true
    end
    
    should "be added to a movie and user" do
      assert_does_not_contain @silvan.ratings, @rating
      assert_does_not_contain @movie1.ratings, @rating
      assert_equal @movie1.ratings.size, 0
      assert_equal @silvan.ratings.size, 0
      assert_equal @rating.movie, nil
      assert_equal @rating.user, nil
      
      @rating.value = 5
      @rating.movie = @movie1
      @rating.user = @silvan
      @rating.save!
      
      @movie1.reload
      @silvan.reload
      
      assert_contains @silvan.ratings, @rating
      assert_contains @movie1.ratings, @rating
      assert_equal @movie1.ratings.size, 1
      assert_equal @silvan.ratings.size, 1
      assert_equal @rating.movie, @movie1
      assert_equal @rating.user, @silvan
    end
  end
  
  context "A rated movie" do
    setup do 
      @silvan = Factory(:user)
      @stefan = Factory(:user)
      @friendship = Factory(:friendship, :user => @silvan, 
                            :friend => @stefan, :approved => true)
      @marcos = Factory(:user)
      @friendship = Factory(:friendship, :user => @marcos, 
                            :friend => @silvan, :approved => true)
      @muster = Factory(:user)
      @movie1 = Factory(:movie)
    end
    
    should "have different averages" do
      assert_equal @movie1.ratings.size, 0
      assert_equal @movie1.rating_all, nil
      assert_equal @movie1.rating_friends_of(@silvan), nil 
      assert_equal @movie1.rating_friends_of(@stefan), nil 
      assert_equal @movie1.rating_friends_of(@muster), nil 
      
      @movie1.ratings << Factory(:rating, :user => @silvan, :value => 4)
      assert_equal @movie1.ratings.size, 1
      assert_equal @movie1.rating_all, 4
      assert_equal @movie1.rating_friends_of(@silvan), nil 
      assert_equal @movie1.rating_friends_of(@stefan), 4 
      assert_equal @movie1.rating_friends_of(@muster), nil
      
      @movie1.ratings << Factory(:rating, :user => @muster, :value => 6)
      assert_equal @movie1.ratings.size, 2
      assert_equal @movie1.rating_all, 5
      assert_equal @movie1.rating_friends_of(@silvan), nil 
      assert_equal @movie1.rating_friends_of(@stefan), 4 
      assert_equal @movie1.rating_friends_of(@muster), nil
      
      @movie1.ratings << Factory(:rating, :user => @stefan, :value => 8)
      assert_equal @movie1.ratings.size, 3
      assert_equal @movie1.rating_all, 6
      assert_equal @movie1.rating_friends_of(@silvan), 8 
      assert_equal @movie1.rating_friends_of(@stefan), 4 
      assert_equal @movie1.rating_friends_of(@muster), nil
      
      @movie1.ratings << Factory(:rating, :user => @marcos, :value => 8)
      assert_equal @movie1.ratings.size, 4
      assert_equal @movie1.rating_all, 6.5
      assert_equal @movie1.rating_friends_of(@silvan), 8
      assert_equal @movie1.rating_friends_of(@stefan), 4 
      assert_equal @movie1.rating_friends_of(@muster), nil
      assert_equal @movie1.rating_friends_of(@marcos), 4
    end
  end
  
end
