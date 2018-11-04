module ApplicationHelper
  def page_title(page_title)
    title = "Chat apps"

    if page_title
      page_title + "|" + title
    else
      title
    end
  end
end
