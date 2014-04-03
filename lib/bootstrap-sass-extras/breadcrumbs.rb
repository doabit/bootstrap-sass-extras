module BootstrapSassExtras
  module BreadCrumbs
    def self.included(base)
      base.extend(ClassMethods)
      base.helper_method :breadcrumbs?,
                         :breadcrumb_names,
                         :last_breadcrumb_name
    end

    module ClassMethods
      def add_breadcrumb(name, url, options = {})
        class_name = self.name
        before_filter options do |controller|
          if name.is_a?(Symbol)
            name = controller.send :translate_breadcrumb, name, class_name
          end
          controller.send :add_breadcrumb, name, url
        end
      end
    end

    protected

    def add_breadcrumb(name, url = '', options = {})
      @breadcrumbs ||= []
      name = translate_breadcrumb(name, self.class.name) if name.is_a?(Symbol)
      url = send(url.to_s) if url =~ /_path|_url|@/
      @breadcrumbs << { name: name, url: url, options: options }
    end

    def translate_breadcrumb(name, class_name)
      scope = [:breadcrumbs]
      namespace = class_name.underscore.split('/')
      namespace.last.sub!('_controller', '')
      scope << namespace

      I18n.t name, scope: scope
    end

    def clear_breadcrumbs
      @breadcrumbs = nil
    end

    def breadcrumbs?
      Array(@breadcrumbs).any?
    end

    def breadcrumb_names
      Array(@breadcrumbs).map { |breadcrumb| breadcrumb[:name] }
    end

    def last_breadcrumb_name
      return unless crumb = Array(@breadcrumbs).last
      crumb[:name]
    end
  end
end
