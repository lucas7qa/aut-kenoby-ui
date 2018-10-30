Feature: Candidate's Progress

@tc00003 @tc00004
Scenario: Create and Apply New Test - Simple
  Given that I access the job edition page
  When I edit the current job
  And create a new test called 'New Test - Simple'
  Then I must apply 'New Test - Simple' for subscribed candidates

@tc00003
Scenario: Swipe the Candidate
  Given that I access the login page
  When I swipe the candidate to another phase
  And I begin the tests
  Then I must see the questions

@tc00004
Scenario: Disable the Candidate
  Given that I access the login page
  When I check the candidate as disabled
  Then I must have received the email