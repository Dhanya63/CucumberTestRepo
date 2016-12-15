And(/^I am on Domestic Sales Order page$/) do
  @browser.div(id: 'drop_mainmenu').when_present.click
  # using Fast Path: P554210, FOOD0001
  @browser.text_field(id: 'TE_FAST_PATH_BOX').when_present.set 'P554210, FOOD0001'
  @browser.link(id: 'fastPathButton').click

  # TODO - Main Menu navigation
  # @browser.img(id: 'I754753').when_present.click
  # @browser.table(id: 'menuItem754753').table.tr.td.table.click
  # @browser.span(:xpath, '//*[@id="menuItem754753"]').click
  # @browser.div(tasklabel: 'JRS Main Menu').click
  # @browser.table(class: 'MenuNormal').td.(text: "JRS Main Menu")
  # @browser.span(id: 'fldnode754754').when_present.click
  # @browser.span(id: 'fldnode754758').when_present.click
  # @browser.link(id: 'fldnode754775').when_present.click
end

When(/^I inquire for next status "([^"]*)"$/) do |status_code|
  @browser.iframe(id: 'e1menuAppIframe').body.text_field(name: 'qbe0_1.5', title: 'Next Status').set status_code
  @browser.iframe(id: 'e1menuAppIframe').body.img(id: 'hc_Find').parent.when_present.click
  sleep 10
end

Then(/^all the domestic open orders are displayed$/) do
  rows = @browser.iframe(id: 'e1menuAppIframe').body.table(id: 'jdeGridData0_1').trs.size
  #rows = @browser.iframe(id: 'e1menuAppIframe').body.table(id: 'jdeGridData0_1').div(id: "jdeGridBack0_1").trs.size
  sleep 5
  expect(rows).to be > 1 # 1 default rows appear without data
  puts rows
  #TODO - No data displays
end

When /^I click on Add image from the header menu$/ do
  @browser.iframe(id: 'e1menuAppIframe').body.img(id: 'hc_Add').click
  sleep 10
  puts 'Clicked on Add image from the header menu'
end

When /^I should navigate to 'Order Headers' screen$/ do
  header_menu = @browser.iframe(id: 'e1menuAppIframe').body.span(id: "jdeFormTitle0").text()
  expect(header_menu).to eq(' Order Header')
  puts 'Successfully Navigated to Requistion order Screen'
end

When /^I click on Find image from the header menu$/ do
  @browser.iframe(id: 'e1menuAppIframe').body.img(id: 'hc_Find').when_present.click
  sleep 5
  puts 'Find image clicked'
end


When /^I click on Select image from the header menu$/ do
  @browser.iframe(id: 'e1menuAppIframe').body.img(id: 'hc_Select').click
  puts 'Select image clicked'
end

And /^the route code is updated$/ do
  @browser.iframe(id: 'e1menuAppIframe').body.text_field(id: 'C0_33', title: 'Budget Approver').click
  puts 'The entry is saved'
  sleep 5
  @browser.iframe(id: 'e1menuAppIframe').body.img(id: 'hc_OK').click
  puts 'The Approval Route Code is set to the eneterd person_id'
end


And /^I enter a valid approval route code "([^"]*)"$/ do |approval_rc|

  @browser.iframe(id: 'e1menuAppIframe').body.text_field(id: 'C0_24', title: 'Approval Route Code').set approval_rc
  puts 'Entered valid Approval Route code for the user'

end

Then /^I click on cancel image from the header menu$/ do
  @browser.iframe(id: 'e1menuAppIframe').body.img(id: 'hc_Cancel').click
end

Then /^I enter a valid item number "([^"]*)"$/ do |item_number|
  sleep 10
  @browser.iframe(id: 'e1menuAppIframe').body.table(id: 'jdeGridData0_1.0').td(id)
      @browser.iframe(id: 'e1menuAppIframe').body.td(id: 'G0_1_R0')
  @browser.iframe(id: 'e1menuAppIframe').col(:index => 1).set item_number

  @browser.iframe(id: 'e1menuAppIframe')
 # @browser.iframe(id: 'e1menuAppIframe').body.table.tr(id: 'jdeGridData0_1.0' , class: 'JSGridCell  editableModifier  selectedModifier').td(:index => 1).click
  sleep 5
 # @browser.send_keys item_number
end

When /^I click on 'Requistion Route & Default Branch Setup' screen$/ do
  @browser.table(title: 'Task Type: Non Software Task, Fastpath Code: JRS0000002500').click
  puts "Drop down should be displayed"
end

When /^I click on 'Approval Route Code Report' sublink$/ do
  @browser.table(title: 'Report: R5700182, Version: ARGI0001').when_present.click
end



When /^I click on view report link$/ do
  sleep 10
@browser.div(id: 'drop_reportmenu').click
  @browser.table(id: 'RecRptsTable').click
  puts "Navigated to Submit Job Search screen"
end

Then /^I verify I am on 'Printer Selection' screen$/ do
  sleep 5
  header_menu = @browser.iframe(id: 'e1menuAppIframe').body.span(id: "jdeFormTitle0").text()
  expect(header_menu).to eq(' Printer Selection')
  puts "Successfully Navigated to Printer Selection screen"
end

And /^I am on Home Page$/ do
  sleep 20
 #home =@browser.iframe(id: 'e1menuAppIframe').body.div(id: 'master').text
 # puts home
 # home.should be_present
  puts "I am on Home page"
end

And /^I click on 'Requisition' link$/ do
  @browser.table(title: 'Task Type: Non Software Task, Fastpath Code: JRS0000002494').click
  puts 'Requisition Approval sublink is displayed'
end

And /^I click on 'Approve Requisition Inquiry' sublink$/ do
  @browser.table(title: 'Application: P4310, Form: W4310G, Version: FOOD0015').click
end

And /^I enter a valid branch plant number "([^"]*)"$/ do |branch_plant_number|
@browser.iframe(id: 'e1menuAppIframe').body.text_field(id: 'C0_7', title: 'Business Unit1').set branch_plant_number
end

 And /^I filter based on the latest order date$/ do
   @browser.scroll(@browser.iframe(id: 'e1menuAppIframe').body.text_field(title: 'Order Date'))
 end