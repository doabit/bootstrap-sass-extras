module BadgeHelper
  # ==== Examples
  #
  # badge(2)
  #   => <span class="badge">2</span>
  # badge(nil)
  #   => nil

  def badge(count)
    return unless count
    content_tag(:span, count, class: "badge")
  end
end
