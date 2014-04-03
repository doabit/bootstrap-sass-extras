require 'spec_helper'

describe BootstrapFlashHelper do
  describe "#bootstrap_flash" do
    let(:html) { %(<div class="alert alert-%s alert-dismissable"><button class="close" data-dismiss="alert" type="button">&times;</button>%s</div>) }

    def flash_test(input, output)
      stub!(:flash).and_return(input)
      bootstrap_flash.should == html % output.to_a.flatten
    end

    it "returns alert-warning when sent a :warning message" do
      message = "Update Warning!"
      flash_test({ warning: message }, { warning: message })
    end

    it "returns alert-success when sent a :notice message" do
      message = "Update Success!"
      flash_test({ notice: message }, { success: message })
    end

    it "returns alert-danger when sent an :error message" do
      message = "Update Failed!"
      flash_test({ error: message }, { danger: message })
    end

    it "returns alert-danger when sent an :alert message" do
      message = "Update Alert!"
      flash_test({ alert: message }, { danger: message })
    end

    it "returns alert-info when sent a info message" do
      message = "Update Information!"
      flash_test({ info: message }, { info: message })
    end

    it "returns custom type when sent an unknown message" do
      message = "Update Unknown!"
      flash_test({ undefined: message }, { undefined: message })
    end

    it "properly handles string types" do
      message = "String to Symbol Test."
      flash_test({ "info" => message }, { info: message })
    end

    it "returns nil when sent a blank message" do
      stub!(:flash).and_return(notice: "")
      bootstrap_flash.should be_nil
    end

    it "returns nil when message doesn't have an implicit conversion to String" do
      stub!(:flash).and_return(notice: true)
      bootstrap_flash.should be_nil
    end
  end
end
