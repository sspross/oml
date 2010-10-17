class Image < ActiveRecord::Base
  
  translates :description
  
  has_attachment  :content_type => :image, 
                  :storage => :file_system, 
                  :max_size => 800.kilobytes,
                  #:resize_to => '320x200>',
                  :thumbnails => { :thumb => '60x45' },
                  :partition => false

  validates_as_attachment
  
end
