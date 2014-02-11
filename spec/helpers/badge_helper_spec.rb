require 'spec_helper'

describe BadgeHelper do
  describe "#badge" do
    let(:html) { %(<span class="badge">%i</span>) }

    it "returns proper output for badge count" do
      badge(0).should == html % 0
      badge(2).should == html % 2
    end

    it "returns nil for nil badge count" do
      badge(nil).should be_nil
    end
  end
end
