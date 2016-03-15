require 'spec_helper'

describe BootstrapViewportMetaHelper, :type => :helper do
  describe :bootstrap_viewport_meta do
    context "no arguments" do
      it "should return the default viewport meta tag" do
        viewport_meta_tag.should =="<meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0\" />"
      end
    end

    context "with arguments" do
      it "should return the viewport meta tag with the specified options" do
        viewport_meta_tag(initial_scale: "2.0").should =="<meta name=\"viewport\" content=\"width=device-width,initial-scale=2.0\" />"
      end
    end
  end
end
