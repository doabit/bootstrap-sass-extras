require 'spec_helper'

describe GlyphHelper do
  describe "#glyph" do
    let(:html) { %(<span class="glyphicon glyphicon-%s"></span>) }

    it "returns proper output for one glyphicon" do
      glyph(:test).should == html % "test"
    end

    it "returns proper output for more than one glyphicon" do
      glyph(:test1, :test2).should == "#{html % "test1"}#{html % "test2"}"
    end
  end
end
