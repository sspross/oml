module ApplicationHelper
  def flash_box(*types)
    content = ""
    types.each do |type|
      content += content_tag(:div, flash[type], :id => type)
    end
    content
  end
  
  # TODO return a tag instead plain html
  def link_to_unless_active(condition, name, path, clazz)
    if condition
      raw("<span class='%s'>%s</span>" % [clazz, name])
    else
      link_to_unless(condition, name, path)
    end
  end

end
