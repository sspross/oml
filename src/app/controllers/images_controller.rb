class ImagesController < ResourceController::Base

  IMAGES_PER_PAGE = 5

  private
  
    def collection
      @collection ||=  Image.paginate(:page => params[:page], :per_page => IMAGES_PER_PAGE, :conditions => ['parent_id IS ?', nil])
    end

end