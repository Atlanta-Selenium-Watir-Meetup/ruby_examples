require 'spec_helper'

describe "Derp Bear" do
  context "simple example" do
    before(:each) do
      @browser = Watir::Browser.new :chrome
    end
    after(:each) do
      @browser.close
    end

    it "has a title" do
      @browser.goto "http://derp-bear.herokuapp.com"
      @browser.title.should eq "Welcome to Derp-Bear"
    end

  end
end