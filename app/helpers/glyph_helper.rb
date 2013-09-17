module GlyphHelper
  # ==== Examples
  # glyph(:share_alt)
  # # => <i class="icon-share-alt"></i>

  def glyph(*names)
    content_tag :i, nil, :class => names.map{|name| "glyphicon glyphicon-#{name.to_s.gsub('_','-')}" }
  end
end