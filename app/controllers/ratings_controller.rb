class RatingsController < ApplicationController
  resource_controller
  
  create.before do
    object.user = current_user
  end
  
  create do
    wants.html { redirect_to movie_path(@rating.movie) }
    failure.wants.html { redirect_to movie_path(@rating.movie) }
  end
  
  destroy.wants.html { redirect_to movie_path(@rating.movie) }
end
