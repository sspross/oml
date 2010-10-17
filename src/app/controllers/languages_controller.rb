class LanguagesController < ResourceController::Base

  LANGUAGES_PER_PAGE = 5

  private
  
    def collection
      @collection ||= Language.paginate(:page => params[:page], :per_page => LANGUAGES_PER_PAGE)
    end

end