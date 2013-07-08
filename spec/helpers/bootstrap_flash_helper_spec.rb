require 'spec_helper'

describe BootstrapFlashHelper do
  describe "bootstrap_flash" do

     it "should return flash message" do
       stub!(:flash).and_return({:warning => "Update Warning!"})
       bootstrap_flash.should == "<div class=\"alert alert-warning\"><a class=\"close\" data-dismiss=\"alert\">&times;</a>Update Warning!</div>"
     end

     it "should return alert-success message when using notice message" do
       stub!(:flash).and_return({:notice => "Update Success!"})
       bootstrap_flash.should == "<div class=\"alert alert-success\"><a class=\"close\" data-dismiss=\"alert\">&times;</a>Update Success!</div>"
     end

     it "should return alert-error message when using notice error" do
       stub!(:flash).and_return({:error => "Update Failed!"})
       bootstrap_flash.should == "<div class=\"alert alert-error\"><a class=\"close\" data-dismiss=\"alert\">&times;</a>Update Failed!</div>"
     end

     it "should return alert-error message when using alert message" do
       stub!(:flash).and_return({:alert => "Update Alert!"})
       bootstrap_flash.should == "<div class=\"alert alert-error\"><a class=\"close\" data-dismiss=\"alert\">&times;</a>Update Alert!</div>"
     end

     it "should return alert-info message when using info message" do
       stub!(:flash).and_return({:info => "Update Information!"})
       bootstrap_flash.should == "<div class=\"alert alert-info\"><a class=\"close\" data-dismiss=\"alert\">&times;</a>Update Information!</div>"
     end

     it "should return no message when using an undefined message" do
       stub!(:flash).and_return({:undefined => "Update Undefined!"})
       bootstrap_flash.should == ""
     end

   end
end