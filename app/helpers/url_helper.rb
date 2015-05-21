module UrlHelper
  BUTTON_CLASSES = ['btn-default', 'btn-primary', 'btn-success', 'btn-info', 'btn-warning',
    'btn-danger', 'btn-link'].freeze

  def self.included(class_)
    class_.class_eval do
      def button_to(*args, &proc)
        args << nil if args.length < 2
        args << {} if args.length < 3
        button_to_with_bootstrap(*args, &proc)
        super(*args, &proc)
      end
    end
  end

  def button_to_with_bootstrap(name = nil, options = nil, html_options = {}, &block)
    html_options[:class] ||= []
    html_options[:class] = [*html_options[:class]]

    html_options[:class].unshift('btn') unless html_options[:class].include?('btn')
    if html_options[:class].select { |cls| UrlHelper::BUTTON_CLASSES.include?(cls) }.empty?
      html_options[:class] << 'btn-default'
    end
  end
end
