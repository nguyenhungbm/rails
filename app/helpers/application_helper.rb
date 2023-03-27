module ApplicationHelper
  def full_title(page_title = "") # Method def, optional arg
    base_title = "Ruby on Rails Tutorial Sample App" # Variable assignment
    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
