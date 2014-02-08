module GlyphHelper
  # ==== Examples
  #
  # glyph(:search)
  #   => <span class="glyphicon glyphicon-search"></span>
  # glyph(:search, :paperclip)
  #   => <span class="glyphicon glyphicon-search"></span><span class="glyphicon glyphicon-paperclip"></span>

  def glyph(*glyphicon_names)
    safe_join(glyphicon_names.map do |name|
                content_tag :span, nil, class: "glyphicon glyphicon-#{name.to_s.parameterize}"
              end, "")
  end
end
