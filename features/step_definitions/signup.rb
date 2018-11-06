Given("that I access the job page") do
  @page.(Home).load
  @page.(Home).access_job
end

When("I send the register") do
  @first_name = Faker::Name.first_name.downcase
  @last_name = Faker::Name.last_name.downcase
  @email = @first_name + @last_name
  @page.(RegisterEmail).register_email(@email)
  @page.(RegisterUser).register_first_time(@email,@first_name,@last_name)
  @page.(RegisterUser).register
  @page.(Mailinator).load
  @page.(Mailinator).open_mailbox(@email)
  @page.(Mailinator).show_email
  @page.(CurrentJob).enter_job('New Test - Simple')
  @page.(Test).fill_tests
end

When("I send the register for {string}") do |scenario|
  @first_name = Faker::Name.first_name.downcase
  @last_name = Faker::Name.last_name.downcase
  @email = @first_name + @last_name
  @page.(RegisterEmail).register_email(@email)
  @page.(RegisterUser).register_first_time(@email,@first_name,@last_name)
  @page.(RegisterUser).register
  @page.(Mailinator).load
  sleep 10
  @page.(Mailinator).open_mailbox(@email)
  @page.(Mailinator).show_email
  @page.(CurrentJob).enter_job(scenario)
  if scenario != 'Rankdone'
    @page.(Test).fill_specific_tests_kenoby(scenario)
  end
end

Then("I must be applying for the vacancy") do
  @page.(Test).assert_message
  puts 'Teste finalizado, boa sorte em seu processo de candidatura!'
end

Then("I should see a message about the {string} test in my email box") do |company|
  sleep 10
  @page.(Mailinator).load
  @page.(Mailinator).open_mailbox(@email)
  @page.(Mailinator).assert_on_email(company)
end

Then("I should see a message about {string} tests in the current screen") do |company|
  sleep 10
  assert_text company.upcase
  sleep 5
end