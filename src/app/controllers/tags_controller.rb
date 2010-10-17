class TagsController < ResourceController::Base
  
  before_filter :images, :only => [:new, :edit, :create]

  TAGS_PER_PAGE = 5

  private
  
    def collection
      @collection ||= Tag.paginate(:page => params[:page], :per_page => TAGS_PER_PAGE)
    end
    
    def images
      @images = Image.find(:all, :conditions => ['parent_id IS ?', nil])
    end

end