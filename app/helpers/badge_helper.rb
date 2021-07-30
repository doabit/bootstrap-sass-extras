module BadgeHelper
  # ==== Examples
  #
  # badge(2)
  #   => <span class="badge">2</span>
  # badge(nil)
  #   => nil

  def badge(count, severity = nil)
    return unless count
    level = ""
    level = "badge-#{severity}" if severity.present?

    content_tag(:span, count, class: "badge #{level}")
  end
end
