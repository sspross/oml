class RatingsController < ApplicationController
  resource_controller
  
  create.before do
    object.user = current_user
  end
end
