# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # TODO return a tag instead plain html
  def link_to_unless_active(condition, name, path, clazz)
    if condition
      "<span class='%s'>%s</span>" % [clazz, name]
    else
      link_to_unless(condition, name, path)
    end
  end
  
end
