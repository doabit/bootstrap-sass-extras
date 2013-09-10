require 'spec_helper'

describe BootstrapViewportMetaHelper do
  describe :viewport_meta_tag do
    context "no arguments" do
      it "should return the default viewport meta tag" do
        viewport_meta_tag.should =="<meta content=\"width=device-width,initial-scale=1.0\" name=\"viewport\" />"
      end
    end

    context "with arguments" do
      it "should return the viewport meta tag with the specified options" do
        viewport_meta_tag(initial_scale: "2.0").should =="<meta content=\"width=device-width,initial-scale=2.0\" name=\"viewport\" />"
      end
    end
  end
end
