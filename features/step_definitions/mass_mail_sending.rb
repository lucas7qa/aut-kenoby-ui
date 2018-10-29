When("I send the test reminder to the sorted candidates") do
  @page.(MassMailSending).send_test_reminder
end

When("access a candidate mail") do
  email = page.all('#card-applicant-name')[4].text.downcase.split.join('')
  visit "http://mailnesia.com/mailbox/#{email}"
end

Then("I should start the test indicated on the reminder email") do
  sleep 10
end

When("I send an {string} with the text body {string} to the sorted candidates") do |mail_type, text_body|
  @page.(MassMailSending).send_mail(text_body)
end

When("I send the template mail {string}") do |template|
  @page.(MassMailSending).send_model_mail(template)
end

Then("I should reply the email with {string}") do |text_body|
	@page.(MassMailSending).reply_mail(text_body)
end