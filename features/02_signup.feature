Feature: Apply for a vacancy

@tc00001 @tc00001-01
Scenario: Apply for a job with specific test
  Given that I access the job page
  When I send the register for 'New Test - Simple'
  Then I must be applying for the vacancy