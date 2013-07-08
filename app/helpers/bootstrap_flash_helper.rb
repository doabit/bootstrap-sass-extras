module BootstrapFlashHelper
  ALERT_TYPES = [:error, :info, :success, :warning]

  def bootstrap_flash
    output = ''
    flash.each do |type, message|
      next if message.blank?
      type = :success if type == :notice
      type = :error   if type == :alert
      next unless ALERT_TYPES.include?(type)
      output += flash_container(type, message)
    end

    raw(output)
  end

  def flash_container(type, message)
    raw(content_tag(:div, :class => "alert alert-#{type}") do
      content_tag(:a, raw("&times;"),:class => 'close', :data => {:dismiss => 'alert'}) +
      message
    end)
  end
end
