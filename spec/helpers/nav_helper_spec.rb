require 'spec_helper'

describe NavHelper, :type => :helper do
  describe "#tabs" do
    before do
      def self.current_page?(path)
        path == '/'
      end
    end

    let(:html) {
      <<-TABS.strip_heredoc
          <ul class="nav nav-tabs">
            <li role="presentation" class="active"><a href="/">Name</a></li>
            <li role="presentation"><a href="/profile">Profile</a></li>
          </ul>
      TABS
    }

    it "generates the correct link" do
      (nav do
        concat "\n  "
        concat (nav_to 'Name', '/')
        concat "\n  "
        concat (nav_to '/profile' do
          'Profile'
        end)
        concat "\n"
      end + "\n").should == html
    end

    context "when a type of navigation is specified" do
      let(:html) { '<ul class="nav nav-pills"></ul>' }

      it "generates the correct link" do
        (nav class: 'nav-pills').should == html
      end
    end

    context "when the navigation type helper is used" do
      let(:html) { '<ul class="nav nav-tabs"></ul>' }

      it "generates the correct link" do
        (tabs).should == html
      end
    end

    context "when a stacked nav is used" do
      let(:html) { '<ul class="nav nav-stacked nav-pills"></ul>' }

      it "generates the correct link" do
        (pills class: 'nav-stacked').should == html
      end
    end
  end
end
