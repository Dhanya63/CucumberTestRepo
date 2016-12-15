
And (/^I verify the route code exists$/) do
  row = @browser.iframe(id: 'e1menuAppIframe').body.table(id: 'jdeGridData0_1')
  #add if statement for when code not present
  expect(row).to be_present
  puts "Approval route code exists!"
  @browser.iframe(id: 'e1menuAppIframe').body.checkbox(name: 'grs0_1').click
  puts 'Selected the approval route code'
  step %{I click on Select image from the header menu}
 # step %{I verify if the user exists}
end

And /^I enter a valid amount "([^"]*)"$/ do |amount|
  sleep 5
 tdata= @browser.iframe(id: 'e1menuAppIframe').body.table(id: 'jdeGrid0_1').tbody.trs
  puts tdata
  # radio_btn = @browser.iframe(id: 'e1menuAppIframe').body.radio(name: 'grs0_1', title: 'Row:3').set
 # puts radio_btn.class
 #r_size = radio_btn.size
  radio_btn = @browser.iframe(id: 'e1menuAppIframe').body.radio(name: 'grs0_1')
  puts "Obj: #{radio_btn} -- Class:#{radio_btn.class}"
  # @browser.send_keys amount
  puts 'Amount entered for an approver'
end



When(/^I add an existing user "([^"]*)"$/) do |user_id|
  step %{I click on Add image from the header menu}
  #TODO: add step definition of the validation step inside this step definition
  #verifying "User Default Location & Approval" screen is displayed
  header = @browser.iframe(id: 'e1menuAppIframe').body.span(id: 'jdeFormTitle0').text()
  puts header
  expect(header). to eq(' Default Location & Approval')
  puts "Navigated to User Default Location & Approval screen"
  #entering the user id of the approver
  @browser.iframe(id: 'e1menuAppIframe').body.text_field(id: 'C0_6', title: 'Terminal/User ID').set user_id
  puts 'Valid user id is entered'
  end

Then /^the user is assigned with the route code$/ do
  sleep 10
  step %{I click on OK image from the header menu}
  step %{I click on cancel image from the header menu}
  step %{I click on Find image from the header menu}
  row = @browser.iframe(id: 'e1menuAppIframe').body.table(id: 'jdeGridData0_1.0')
  if row.present? ? (puts 'The user is assigned with a route code') : (puts 'The entered user is not assigned with route code')
  end
 5.times do row.flash
 end
  end

# And /^I should be navigated to 'User Default Location & Approval Route' screen$/ do
#   step %{I click on Add image from the header menu}
#   header = @browser.iframe(id: 'e1menuAppIframe').body.span(id: 'jdeFormTitle0').text()
#   puts header
#   expect(header). to eq(' Default Location & Approval')
#   puts "Navigated to User Defaukt Location & Approval screen"
# end

When /^I enter valid branch number "([^"]*)"$/ do |branch_number|
  #steps to navigate to approval route code processing option screen
  @browser.table(title: 'Task Type: Non Software Task, Fastpath Code: JRS0000002500').click
  puts "Drop down should be displayed"
  @browser.table(title: 'Report: R5700182, Version: ARGI0001').when_present.click
  #entering the valid branch/plant number
  @browser.iframe(id: 'e1menuAppIframe').body.input(id: 'PO1T0').to_subtype.clear
  @browser.send_keys branch_number
  puts "Branch Number entered"
end

Then /^I verify the report is generated successfully$/ do
  step %{I click on Select image from the header menu}
  #Verifying the "Printer Selection" screen is displayed
  sleep 5
  header_menu = @browser.iframe(id: 'e1menuAppIframe').body.span(id: "jdeFormTitle0").text()
  expect(header_menu).to eq(' Printer Selection')
  puts "Successfully navigated to the Printer Selection screen"
  step %{I click on OK image from the header menu}
  step %{I click on view report link}
  # verifying the status and the name of the report
  rows = @browser.iframe(id: 'e1menuAppIframe').body.table(id: 'jdeGridData0_1').trs.first.text
  row1 = rows.delete!("\n")
  if (row1.include?("Done") && row1.include?("Approval Route Code"))
    puts "Approval Route Code Report is processed successfully and the status is Done"
  else
    puts "Approval Route Code Report is not processed succesfully"
  end
end

And /I verify if the user exists/ do
  sleep 5
  user = @browser.iframe(id: 'e1menuAppIframe').body.table(id: 'jdeGridData0_1').trs
  puts user.text()
end

And /^the user logs out from the application$/ do
  @browser.div(id: 'userSessionDropdownArrow').click
  @browser.div(id: 'logoutIcon').click
end


And /^I click on close image from the header menu$/ do
  @browser.iframe(id: 'e1menuAppIframe').body.img(id: 'hc_Close').click
end

And /^I filter by recent order date$/ do
 step %{I click on 'Requisition' link}
 step %{I click on 'Approve Requisition Inquiry' sublink}
  #Selecting the order date as the same date 2 months ago
  last_month_date = Time.new.to_datetime.prev_month(2).strftime("%m/%d/%Y").to_s
  order_date =  ">#{last_month_date}"
  date = @browser.iframe(id: 'e1menuAppIframe').body.text_field(title: 'Order Date')
  scroll(date)
step

end

Then /^the list of approved requistion is diaplayed$/ do

end

And /^I delete the user associated with the approval route code$/ do
  step %{I click on Find image from the header menu}
  #Verifying if the route code exits for am user
  if @browser.iframe(id: 'e1menuAppIframe').body.table(id: 'jdeGridData0_1.0').present?
    @browser.iframe(id: 'e1menuAppIframe').body.checkbox(name: 'grs0_1').click
    #Deleting the existing approval route for an user
    step %{I click on delete image from the header menu}
    sleep 2
    @browser.driver.switch_to().alert().accept()
    @browser.iframe(id: 'e1menuAppIframe').body.table(id: 'jdeGridData0_1.0').should_not be
  else
    #if the route code doesnot exists then following message will be displayed
    puts "Existing user is not associated with any approval route code"
  end
end

And /I click on delete image from the header menu/ do
  @browser.iframe(id: 'e1menuAppIframe').body.img(id: 'hc_Delete').click
end