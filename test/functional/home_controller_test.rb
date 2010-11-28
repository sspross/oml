require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  context "GET startpage in english" do
    setup { get :index, :locale => 'en' }
    should respond_with(:success)
  end
  
  context "GET startpage in german" do
    setup { get :index, :locale => 'de' }
    should respond_with(:success)
  end    

end
