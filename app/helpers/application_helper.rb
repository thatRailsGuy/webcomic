module ApplicationHelper
  def admin?
    controller.class.name.split("::").first=="Admin"
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to "#{title} #{icon_sort(column)}".html_safe, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def icon_sort(column)
    if sort_column == column
      if sort_direction == "asc"
        "<i class=\"iconic-arrow-up\"> </i>"
      else
        "<i class=\"iconic-arrow-down\"> </i>"
      end
    end
  end
end
