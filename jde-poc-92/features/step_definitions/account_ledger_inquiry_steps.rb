Given(/^I am logged in as "([^"]*)" user/) do |user_type|
  #TODO Validate Role/User
  visit(LoginPage)
  on(LoginPage).login(user_type)
end

And(/^I fastpath to "([^"]*)"$/) do |path_code|
  @browser.div(id: 'drop_mainmenu').when_present.click
  @browser.text_field(id: 'TE_FAST_PATH_BOX').set(path_code)
  @browser.link(title: 'Fast Path').when_present.click
  sleep 3
end

And(/^I have a valid account as "([^"]*)"$/) do |acc_no|
  @browser.iframe(id: 'e1menuAppIframe').body.span(id: 'outer0_47').text_field(id: 'C0_47').set(acc_no)
end

And(/^I have a from date as "([^"]*)"$/) do |from_date|
  puts "from_date: #{from_date}"
  @browser.iframe(id: 'e1menuAppIframe').body.span(id: 'outer0_51').text_field(id: 'C0_51').set(from_date)
end

And(/^I have a thru date as "([^"]*)"$/) do |thru_date|
  puts "thru_date: #{thru_date}"
  @browser.iframe(id: 'e1menuAppIframe').body.span(id: 'outer0_53').text_field(id: 'C0_53').set(thru_date)
end

When(/^I inquire on the account$/) do
  @browser.iframe(id: 'e1menuAppIframe').body.td(id: 'outer0_15').link(id: 'C0_15').when_present.click
end

Then(/^the transactions are displayed$/) do
  # columns = @browser.iframe(id: 'e1menuAppIframe').body.table(id: 'jdeGridData0_1').tbody.tr.td.table(id: 'jdeGridData0_1.4').tr(id: 'G0_1_R5')
  sleep 10
  #@browser.iframe(id: 'e1menuAppIframe').table(id: "jdeGrid0_1").div(id: "jdeGridBack0_1").when_present.click
  rows = @browser.iframe(id: 'e1menuAppIframe').table(id: "jdeGrid0_1").div(id: "jdeGridBack0_1").trs.size
  expect(rows).to be > 1 # 1 default row appear without data
  #TODO - No data displays

  #TODO:Asserting the Total values for ideal test automation
  # @browser.iframe(id: 'e1menuAppIframe').table(id: 'jdeGridData0_1').tr.td(id: "jdeGridContainer0_1").click
  # putledger_total_row = @browser.iframe(id: 'e1menuAppIframe').table(id: 'jdeGridData0_1').tr.td(id: "jdeGridContainer0_1")
  # puts ledger_total_row
  # ledger_total = ledger_total_row.split(' ')
  # puts ledger_total.inspect
  #
  # puts ledger_total[2]
  # puts ledger_total[3]
  # expect(ledger_total[2]).to eq(ledger_total[3])

  # TODO: Ideal Approach is to pick row dynamically
  #NW ledger_total = @browser.iframe(id: 'e1menuAppIframe').table(id: 'jdeGridData0_1').row(:text, /Ledger Total/).cell(:index => 2).text
  # puts columns.td(index: 6).text
  # columns.each {|c| puts c}
end