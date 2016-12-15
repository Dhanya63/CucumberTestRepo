And(/^I am on Item Ledger Cardex page$/) do
  @browser.div(id: 'drop_mainmenu').when_present.click
  # using Fast Path: P554210
  @browser.text_field(id: 'TE_FAST_PATH_BOX').when_present.set 'P4111'
  @browser.link(id: 'fastPathButton').click
end

And(/^I enter a valid item "([^"]*)"$/) do |item_no|
  @browser.iframe(id: 'e1menuAppIframe').body.text_field(id: 'C0_17', title: 'Item Number').set item_no
  @@item_no = item_no
end

And(/^I enter a valid branch-plant "([^"]*)"$/) do |branch_no|
  @browser.iframe(id: 'e1menuAppIframe').body.text_field(id: 'C0_21', title: 'Branch/Plant').set branch_no
  @@branch_no = branch_no
end

When(/^I inquire on the Item Ledger Cardex$/) do
  @browser.iframe(id: 'e1menuAppIframe').body.img(id: 'hc_Find').parent.when_present.click
end

And(/^I select a valid row "([^"]*)"$/) do |grid_row|
  @browser.iframe(id: 'e1menuAppIframe').body.checkbox(name: 'grs0_1').when_present.set
end

Then(/^item details should be displayed in the Item Ledger Cardex form$/) do
  @browser.iframe(id: 'e1menuAppIframe').body.img(id: 'ROW_EXIT_BUTTON').when_present.click
    @browser.iframe(id: 'e1menuAppIframe').body.table(id: 'HE0_128').fire_event :click
  item_no = @browser.iframe(id: 'e1menuAppIframe').body.input(title: "Item Number").value.strip
  branch_no = @browser.iframe(id: 'e1menuAppIframe').body.input(title: "Branch/Plant").value.strip
  # Assert Item Ledger Detail Data
  expect(@@item_no).to eq(item_no)
  expect(@@branch_no).to eq(branch_no)
end