require 'spec_helper'

describe UrlHelper, :type => :helper do
  describe "#button_to" do
    def pattern(label, class_)
      Regexp.new(Regexp.escape(html % [class_, label]))
    end

    let(:html) { %(<input class="btn %s" type="submit" value="%s" />) }

    it "emits proper classes to style buttons" do
      button_to("Test", "/test").should =~ pattern("Test", "btn-default")
    end

    it "does not emit a default if a button type is specified" do
      button_to("Test", "/test", class: 'btn-danger').should =~ pattern("Test", "btn-danger")
    end
  end
end
