module NavHelper
  NAV_CLASS = 'nav'.freeze
  NAV_TABS_CLASS = 'nav-tabs'.freeze
  NAV_PILLS_CLASS = 'nav-pills'.freeze
  NAV_CLASSES = [NAV_TABS_CLASS, NAV_PILLS_CLASS]

  def nav(options = {}, type = NAV_TABS_CLASS, &block)
    options, type = {}, options unless options.is_a?(Hash)
    options[:class] ||= []
    options[:class] = [*options[:class]]
    options[:class].unshift(NAV_CLASS) unless options[:class].include?(NAV_CLASS)
    options[:class] << type unless NAV_CLASSES.any? { |c| options[:class].include?(c) }

    content_or_options_with_block = options if block_given?
    content_tag(:ul, content_or_options_with_block, options, &block)
  end
  alias_method(:tabs, :nav)

  def pills(*args, &block)
    nav(*args, NAV_PILLS_CLASS, &block)
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
