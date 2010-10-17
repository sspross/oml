class TitlesController < ResourceController::Base
  
  before_filter :languages, :only => [:new, :edit, :create]

  TITLES_PER_PAGE = 5

  private
  
    def collection
      @collection ||= Title.paginate(:page => params[:page], :per_page => TITLES_PER_PAGE)
    end
    
    def languages
      @languages = Language.all
    end

end