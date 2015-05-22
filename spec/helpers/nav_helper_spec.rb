require 'spec_helper'

describe NavHelper do
  describe "#tabs" do
    before do
      def self.current_page?(path)
        path == '/'
      end
    end

    let(:html) {
      <<-TABS.strip_heredoc
          <ul class="nav nav-tabs">
            <li class="active" role="presentation"><a href="/">Name</a></li>
            <li role="presentation"><a href="/profile">Profile</a></li>
          </ul>
      TABS
    }

    it "generates the correct link" do
      expect (tabs do
        concat "\n  "
        concat (nav_to 'Name', '/')
        concat "\n  "
        concat (nav_to '/profile' do
          'Profile'
        end)
        concat "\n"
      end + "\n").should == html
    end
  end
end
