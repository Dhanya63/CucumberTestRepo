include DataMagic

Given(/^I am on JDE login page$/) do
  @browser.goto(App::JDE_URL)
end

When(/^I login as "([^"]*)" user$/) do |user_type|
  t = @browser.text_field id: "User"
  users_data = data_for :valid_users
  t.set users_data[user_type]['username']
  t = @browser.text_field id: "Password"
  t.set users_data[user_type]["password"]
  sleep 3
  @browser.input(type: "submit", value: "Sign In").click
end

Then(/^I should see the JDE homepage$/) do
  @browser.div(id: "drop_home").exists?
end
