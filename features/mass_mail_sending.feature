@massive_mail_sending
Feature: Mass Mail Sending Testing 

@tc00012
Scenario: Mass Sending of Test Reminder
  Given that I access the job edition page
  When I send the test reminder to the sorted candidates
  And access a candidate mail
  Then I should start the test indicated on the reminder email

@tc00013
Scenario: Mass Sending of Email
  Given that I access the job edition page
  When I send an 'Email' with the text body 'Envio de e-mail em massa' to the sorted candidates
  #And access a candidate mail
  Then I should reply the email with 'Resposta do e-mail em massa'

@tc00014
Scenario: Mass Sending of Email Based on Template
  Given that I access the job edition page
  When I send the template mail 'Modelo Teste'
  And access a candidate mail
  Then I should reply the email with 'Resposta do e-mail em massa com modelo'