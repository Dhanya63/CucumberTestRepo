include DataMagic

And(/^I enter a valid approver_id for "([^"]*)" user$/) do|user|
  user_data = data_for :valid_users
 id = user_data[user]["approver_id"]
  @browser.send_keys(:tab)
  @browser.send_keys id
  puts "Added a valid approver"
end