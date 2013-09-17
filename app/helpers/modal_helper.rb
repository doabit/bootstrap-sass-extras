module ModalHelper

  #modals have a header, a body, a footer for options.
  def modal_dialog(options = {}, &block)
    content_tag :div, :id => options[:id], :class => "modal fade", :role => "dialog" do
      content_tag :div, class: 'modal-dialog' do
        content_tag :div, class: 'modal-content' do
          modal_header(options[:header]) +
          modal_body(options[:body]) +
          modal_footer(options[:footer])
        end
      end
    end
  end

  def modal_header(options = {}, &block)
    dismiss = options.delete(:dismiss) || 'modal'
    content_tag :div, :class => 'modal-header' do
      if options[:show_close]
        close_button(dismiss) +
        content_tag(:h4, options[:title], :class => 'modal-title', &block)
      else
        content_tag(:h4, options[:title], :class => 'modal-title', &block)
      end
    end
  end

  def modal_body(options = {}, &block)
    content_tag :div, options, :class => 'modal-body', &block
  end

  def modal_footer(options = {}, &block)
    content_tag :div, options, :class => 'modal-footer', &block
    end

  def close_button(dismiss)
    content_tag :button, "&times;".html_safe, :class => "close", "data-dismiss" => "#{dismiss}", "aria-hidden" => "true"
  end

  def modal_toggle(content_or_options = nil, options = {}, &block)
    if block_given?
      options = content_or_options if content_or_options.is_a?(Hash)
      default_options = { :class => 'btn', "data-toggle" => "modal", "data-target" => options.delete[:dialog] }.merge(options)

      content_tag :a, nil, default_options, true, &block
    else
      default_options = { :class => 'btn', "data-toggle" => "modal", "data-target" => options.delete(:dialog) }.merge(options)
      content_tag :a, content_or_options, default_options, true
    end
  end

  def modal_cancel_button content, options = {}
    default_options = { :class => "btn btn-default", :data => { dismiss: "modal" } }

    content_tag_string :button, content, default_options.merge(options)
  end

end

