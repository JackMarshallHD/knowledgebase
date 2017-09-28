module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Knowledgebase"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def updated_string(object)
    'Updated ' + object.updated_at.strftime('%a, %b %d %Y')
  end

  def user_name(object)
    object.user ? object.user.name : 'Unknown user'
  end
end
