module LayoutHelper
  # These helper methods can be called in your template to set variables to be
  # used in the layout. This module should be included in all views globally,
  # to do so you need to add this line to application_controller.rb
  # helper :layout

  def title(page_title, show_title = true)
    content_for(:title) { page_title.to_s }
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_tag(*args) }
  end
end
