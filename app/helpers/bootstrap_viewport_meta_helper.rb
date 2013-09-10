module BootstrapViewportMetaHelper
  #
  # Creates the meta tag for Bootstrap with the specified parameters:
  #
  #     <%= viewport_meta_tag %>
  #
  # Renders:
  #
  #     <meta content="width=device-width,initial-scale=1.0" name="viewport" />
  #
  # You can change the content value by passing a hash as an argument:
  #
  #     <%= viewport_meta_tag(:maximum_scale => "1.0") %>
  #
  # Renders:
  #
  #     <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0" name="viewport" />
  #
  def viewport_meta_tag(*args)
    options = {
      width: "device-width",
      initial_scale: "1.0" }.merge(args[0] || {})

      content = options.collect {|key,value| "#{key.to_s.dasherize}=#{value}"}.join(",")
      raw(tag(:meta, name: "viewport", content: content))
  end
end
