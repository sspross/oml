require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  
  context "Two new users" do
    setup do
      @stefan = Factory(:user)
      @silvan = Factory(:user)
      @friendship = Factory(:friendship, :user => @silvan, :friend => @stefan)
    end
    
    should "have no friendship first" do
      assert_does_not_contain @stefan.friends, @silvan
      assert_does_not_contain @silvan.friends, @stefan
    end
    
    should "can request a friendship" do
      assert_contains @silvan.pending_friends, @stefan
      assert_contains @stefan.requesting_friends, @silvan
    end
    
    should "can accept a friendship request" do
      request = @stefan.requested_friendships.first
      request.approved = true
      request.save!
      
      assert_contains @stefan.friends, @silvan
      assert_contains @silvan.friends, @stefan
      
      assert_does_not_contain @silvan.pending_friends, @stefan
      assert_does_not_contain @stefan.requesting_friends, @silvan
    end
    
    should "can end up with a friendship" do
      friendship = @stefan.inverse_friendships.first
      friendship.approved = false
      friendship.save!
      
      assert_does_not_contain @stefan.friends, @silvan
      assert_does_not_contain @silvan.friends, @stefan
      
      assert_contains @silvan.pending_friends, @stefan
      assert_contains @stefan.requesting_friends, @silvan 
    end
  end
  
end
