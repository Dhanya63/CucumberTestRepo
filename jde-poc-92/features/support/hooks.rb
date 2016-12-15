require 'watir-webdriver'



Before do
  @browser = Watir::Browser.new :chrome
  @browser.window.maximize
end


After do
  sleep 5
  @browser.div(id: "userSessionDropdownArrow").when_present.click # Open drop-down
  @browser.div(id: "logoutIcon").when_present.click # Signout
  sleep 1
  @browser.alert.ok if @browser.alert.exists?
  sleep 3
  @browser.close
end
