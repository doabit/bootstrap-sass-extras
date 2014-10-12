module TwitterBreadcrumbsHelper
  def render_breadcrumbs(options = {}, &block)
    return unless breadcrumbs?
    content = render(options[:partial] || 'bootstrap_sass_extras/breadcrumbs')
    if block_given?
      capture(content, &block)
    else
      content
    end
  end
end
