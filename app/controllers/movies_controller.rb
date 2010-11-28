class MoviesController < ApplicationController
  resource_controller

  index.wants.xml { render :xml => @movies.to_xml(:methods => [:rating_all]) }
  index.wants.json { render :json => @movies.to_json(:methods => [:rating_all]) }
  
  show.wants.xml { render :xml => @movie.to_xml(:methods => [:rating_all]) }
  show.wants.json { render :json => @movie.to_json(:methods => [:rating_all]) }
  
end
