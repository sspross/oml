class RolesController < ResourceController::Base
  
  ROLES_PER_PAGE = 5
  
  private
  
    def collection
      @collection ||= Role.paginate(:page => params[:page], :per_page => ROLES_PER_PAGE)
    end
    
end