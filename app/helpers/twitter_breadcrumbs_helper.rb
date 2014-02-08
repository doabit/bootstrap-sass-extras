module TwitterBreadcrumbsHelper
  def render_breadcrumbs(&block)
    content = render 'bootstrap_sass_extras/breadcrumbs'
    if block_given?
      capture(content, &block)
    else
      content
    end
  end
end
