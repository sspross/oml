require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  
  context "GET on index" do
    setup { get :index, :locale => I18n.locale }
    should respond_with(:success)
  end
  
  context "GET on new" do
    setup { get :new, :locale => I18n.locale }
    should respond_with(:success)
  end
  
  context "Minimal Movie" do
    context "POST on create with valid data" do
      setup do
        post :create,
             :locale => I18n.locale,
             :movie => Factory.attributes_for(:movie)
      end
      should respond_with(:redirect)
    end
  end
    
  context "Existing Movie" do
    setup { @movie = Factory(:movie) }

    context "UPDATE on post" do
      setup do
        post :update,
             :id => @movie.id,
             :movie => Factory.attributes_for(:movie),
             :locale => I18n.locale
      end
      should respond_with(:redirect)
    end

    context "DELETE on destroy" do
      setup do
        delete :destroy, 
               :id => @movie.id, 
               :locale => I18n.locale
      end
      should respond_with(:redirect)
    end
  end
  
end
