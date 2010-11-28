require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
  
  context "GET on index" do
    setup { get :index, :locale => I18n.locale }
    should respond_with(:success)
  end
    
  context "Existing Rating" do
    setup { @rating = Factory(:rating, :value => 5) }

    context "DELETE on destroy" do
      setup do
        delete :destroy, 
               :id => @rating.id, 
               :locale => I18n.locale
      end
      should respond_with(:redirect)
    end
  end
  
end
