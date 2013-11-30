Before do
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
      version: '30',
      platform: 'Windows'
  )
  driver = Selenium::WebDriver.for(
      :remote,
      url: "http://sim-dc4ci-gridhub01.ove.local:9000/wd/hub",
      desired_capabilities: caps
  )
  @browser = Watir::Browser.new driver

end

After do
  @browser.close
end

Given(/^I hop$/) do
  p ":("
end

When(/^I land$/) do
  @browser.goto "http://derp-bear.herokuapp.com"
end

Then(/^I am on the ground$/) do
  @browser.title.should eql "Welcome to Derp-Bear"
end

When(/^I submit the form$/) do
  @browser.goto "http://derp-bear.herokuapp.com/forms/simple_form_example"
  @browser.text_field(id: 'first_name').set "hi"
  @browser.text_field(id: 'last_name').set "bye"
  @browser.text_field(id: 'email').set "email@email.com"
  @browser.text_field(id: 'website_url').set "http://example.email.com"
  @browser.select_list(id: 'pet_select').select "Horse"
  @browser.button(value: 'Submit').click

end

Then(/^I should see the success message$/) do
  @browser.h1(text: "Thank you Hi for submitting the form").when_present.text.should eql "Thank you Hi for submitting the form".upcase
end