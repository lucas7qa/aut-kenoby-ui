When("deactivate all the {string} tests with status {string}") do |company, test_status|
  @page.(DeactivateTests).find_active_test(company, test_status)
end

Then("I must delete the tests containing {string} in title") do |test_name|
  step "I edit the current job" 
  @page.(DeactivateTests).delete_tests(test_name)
  sleep 5
end