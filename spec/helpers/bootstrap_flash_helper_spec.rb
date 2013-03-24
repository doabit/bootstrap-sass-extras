require 'spec_helper'

describe BootstrapFlashHelper do
  describe "bootstrap_flash" do

     it "should return flash message" do
       stub!(:flash).and_return({:warning => "Update Success!"})
       bootstrap_flash.should == "<div class=\"alert alert-warning\"><a class=\"close\" data-dismiss=\"alert\">&times;</a>Update Success!</div>"
     end

     it "should return alert-success message when use notice message" do
       stub!(:flash).and_return({:notice => "Update Success!"})
       bootstrap_flash.should == "<div class=\"alert alert-notice\"><a class=\"close\" data-dismiss=\"alert\">&times;</a>Update Success!</div>"
     end

   end
end