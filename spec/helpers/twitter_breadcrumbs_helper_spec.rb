require 'spec_helper'

describe TwitterBreadcrumbsHelper do
  describe "given one breadcrumb" do
    before do
      controller.send(:add_breadcrumb, "Name", "URL")
    end

    describe "#render_breadcrumbs" do
      let(:html) {
        <<-BREADCRUMBS.strip_heredoc
          <ol class="breadcrumb">
            <li class="active">Name</li>
          </ol>
        BREADCRUMBS
      }

      it "returns bootstrap-style breadcrumbs html" do
        helper.render_breadcrumbs.should == html
      end

      describe "given a block" do
        it "returns breadcrumbs wrapped in the captured block" do
          helper.render_breadcrumbs do |crumbs|
            helper.content_tag(:div, crumbs)
          end.should == "<div>#{html}</div>"
        end
      end
    end

    describe "#breadcrumbs?" do
      it "returns true" do
        helper.breadcrumbs?.should be_true
      end
    end

    describe "#breadcrumb_names" do
      it "returns an array of breadcrumb names" do
        helper.breadcrumb_names.should == ["Name"]
        controller.send(:breadcrumb_names).should == ["Name"]
      end
    end

    describe "#last_breadcrumb_name" do
      it "returns a breadcrumb name" do
        helper.last_breadcrumb_name.should == "Name"
        controller.send(:last_breadcrumb_name).should == "Name"
      end
    end

    describe "#clear_breadcrumbs" do
      it "empties all existing breadcrumbs" do
        helper.breadcrumbs?.should be_true
        controller.send(:clear_breadcrumbs)
        helper.breadcrumbs?.should be_false
      end
    end
  end

  describe "given two breadcrumbs" do
    before do
      controller.send(:add_breadcrumb, "Name1", "URL1")
      controller.send(:add_breadcrumb, "Name2", "URL2")
    end

    describe "#render_breadcrumbs" do
      let(:html) {
        <<-BREADCRUMBS.strip_heredoc
          <ol class="breadcrumb">
              <li><a href="URL1">Name1</a></li>
            <li class="active">Name2</li>
          </ol>
        BREADCRUMBS
      }

      it "returns bootstrap-style breadcrumbs html" do
        helper.render_breadcrumbs.should == html
      end

      describe "given a block" do
        it "returns breadcrumbs wrapped in the captured block" do
          helper.render_breadcrumbs do |crumbs|
            helper.content_tag(:div, crumbs)
          end.should == "<div>#{html}</div>"
        end
      end
    end

    describe "#breadcrumbs?" do
      it "returns true" do
        helper.breadcrumbs?.should be_true
        controller.send(:breadcrumbs?).should be_true
      end
    end

    describe "#breadcrumb_names" do
      it "returns an array of breadcrumb names" do
        helper.breadcrumb_names.should == ["Name1", "Name2"]
        controller.send(:breadcrumb_names).should == ["Name1", "Name2"]
      end
    end

    describe "#last_breadcrumb_name" do
      it "returns a breadcrumb name" do
        helper.last_breadcrumb_name.should == "Name2"
        controller.send(:last_breadcrumb_name).should == "Name2"
      end
    end

    describe "#clear_breadcrumbs" do
      it "empties all existing breadcrumbs" do
        helper.breadcrumbs?.should be_true
        controller.send(:clear_breadcrumbs)
        helper.breadcrumbs?.should be_false
      end
    end
  end

  describe "given no breadcrumbs" do
    describe "#render_breadcrumbs" do
      it "returns nil" do
        helper.render_breadcrumbs.should be_nil
      end

      describe "given a block" do
        it "returns nil" do
          helper.render_breadcrumbs { |crumbs| "No #{crumbs} here!" }.should be_nil
        end
      end
    end

    describe "#breadcrumbs?" do
      it "returns false" do
        helper.breadcrumbs?.should be_false
        controller.send(:breadcrumbs?).should be_false
      end
    end

    describe "#breadcrumb_names" do
      it "returns an empty array" do
        helper.breadcrumb_names.should == []
        controller.send(:breadcrumb_names).should == []
      end
    end

    describe "#last_breadcrumb_name" do
      it "returns nil" do
        helper.last_breadcrumb_name.should be_nil
        controller.send(:last_breadcrumb_name).should be_nil
      end
    end
  end
end
