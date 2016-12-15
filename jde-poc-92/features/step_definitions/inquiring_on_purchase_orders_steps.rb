And(/^I am on Purchasing Inquiry page$/) do
  @browser.div(id: 'drop_mainmenu').when_present.click
  # using Fast Path: P4310Time
  @browser.text_field(id: 'TE_FAST_PATH_BOX').when_present.set 'P4310'
  @browser.link(id: 'fastPathButton').click
end

When(/^I enter a valid branch plant "([^"]*)"$/) do |branch_plant|
  @browser.iframe(id: 'e1menuAppIframe').body.text_field(id: 'C0_34', title: 'Business Unit1').set branch_plant
end

When(/^I enter a valid branch plant "([^"]*)" number$/) do |branch_plant|
  @browser.iframe(id: 'e1menuAppIframe').body.text_field(id: 'C0_9', title: 'Branch/Plant').set branch_plant
end

And(/^I filter by order date$/) do
  #Selecting the order date as the same date 2 months ago
  last_month_date = Time.new.to_datetime.prev_month(2).strftime("%m/%d/%Y").to_s
  order_date =  ">#{last_month_date}"
  @browser.iframe(id: 'e1menuAppIframe').body.text_field(title: 'Order Date').set order_date
  @browser.iframe(id: 'e1menuAppIframe').body.img(id: 'hc_Find').parent.when_present.click
end

Then(/^a list of purchase orders is displayed$/) do
  rows = @browser.iframe(id: 'e1menuAppIframe').body.table(id: 'jdeGrid0_1').trs.size
  expect(rows).to be > 1 # 1 default row appear without data
  #TODO - No data displays
end

When(/^I enter a valid supplier "([^"]*)"$/) do |supplier|
  @browser.iframe(id: 'e1menuAppIframe').body.text_field(title: "Supplier").set supplier
  puts "Entered the valid supplier number"
end

And (/^I enter a valid ship to "([^"]*)"$/) do |ship_to|
  @browser.iframe(id: 'e1menuAppIframe').body.text_field(id: 'C0_239', title: 'Ship To').set ship_to
  puts 'Entered valid ship_to number'
end

And /^I enter Send to method as (.*)$/ do |send_method|
  @browser.iframe(id: 'e1menuAppIframe').body.text_field(id: 'C0_391', title: 'Send Method').set send_method
  puts "Entered Send Method as #{send_method}"
  sleep 10
end

And /^I inquire a valid route code "([^"]*)"$/ do |route_code|
  @browser.iframe(id: 'e1menuAppIframe').body.text_field(name: 'qbe0_1.1' , title: 'Approval Route Code').set route_code
  step %{I click on Find image from the header menu}
  step %{I verify the route code exists}
end

And /^I click on OK image from the header menu$/ do
  @browser.iframe(id: 'e1menuAppIframe').body.img(id: 'hc_OK').click
  puts 'Clicked on OK image'
end

