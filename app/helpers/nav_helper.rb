module NavHelper
  def tabs(options = {}, &proc)
    content_tag(:ul, class: 'nav nav-tabs'.freeze, &proc)
  end

  def nav_to(name = nil, options = nil, html_options = nil, &block)
    url_options = block_given? ? name : options
    url_options ||= {}

    tab_class = current_page?(url_options) ? 'active' : nil

    content_tag(:li, role: 'presentation', class: tab_class) do
      link_to(name, options, html_options, &block)
    end
  end
end
