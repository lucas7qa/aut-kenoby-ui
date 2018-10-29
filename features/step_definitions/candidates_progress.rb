Given("that I access the login page") do
  steps %{
    Given that I access the job page
    When I send the register
  }
  @page.(Login).load
  @page.(Login).login_page
end

When("I swipe the candidate to another phase") do
  @page.(CandidatesHome).screening_candidate(@email)
end

When("I begin the tests") do
  @page.(Mailinator).load
  page.driver.browser.switch_to.alert.accept if page.driver.browser.switch_to.alert
  @page.(Mailinator).open_mailbox(@email)
  @page.(Mailinator).show_email_second_stage
  @page.(CurrentJob).enter_second_test
end

Then("I must see the questions") do
  sleep 3
  assert_text 'teste'
end

When("I check the candidate as disabled") do
  @page.(CandidatesHome).disabled_candidate(@email)
end

Then("I must have received the email") do
  @page.(Mailinator).load
  page.driver.browser.switch_to.alert.accept if page.driver.browser.switch_to.alert
  sleep 10
  @page.(Mailinator).open_mailbox(@email)
  @page.(Mailinator).show_email_candidate_incompatible
  assert_text @email
end