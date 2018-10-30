@create_and_apply_tests
Feature: Create And Apply Tests

@tc00005
Scenario: Create and Apply New Test - Simple
  Given that I access the job edition page
  When I edit the current job
  And create a new test called 'New Test - Simple'
  Then I must apply 'New Test - Simple' for subscribed candidates

@tc00005 @tc00005-01
Scenario: Apply for a job with specific test
  Given that I access the job page
  When I send the register for 'New Test - Simple'
  Then I must be applying for the vacancy

@tc00006
Scenario: Create and Apply Tests - Limited Time
  Given that I access the job edition page
  When I edit the current job
  And create a new test called 'New Test - Limited Time'
  And set '1 minuto' in limit time for answer each question
  Then I must apply 'New Test - Limited Time' for subscribed candidates

@tc00006 @tc00006-01
Scenario: Apply for a job with specific test
  Given that I access the job page
  When I send the register for 'New Test - Limited Time'
  Then I must be applying for the vacancy

@tc00007
Scenario: Create and Apply Tests - Expiration Date Set
  Given that I access the job edition page
  When I edit the current job
  And create a new test called 'New Test - Expiration Date'
  And set the expiration date of the test to '01/09/2018'
  Then I must apply 'New Test - Expiration Date' for subscribed candidates

@tc00007 @tc00007-01
Scenario: Apply for a job with specific test
  Given that I access the job page
  When I send the register for 'New Test - Expiration Date'
  Then I must be applying for the vacancy

@tc00008
Scenario: Create and Apply New Test - Right Answer
  Given that I access the job edition page
  When I edit the current job
  And create a new test called 'New Test - Right Answer'
  And set the yes or no question to be eliminatory
  Then I must apply 'New Test - Right Answer' for subscribed candidates

@tc00008 @tc00008-01
Scenario: Apply for a job with specific test
  Given that I access the job page
  When I send the register for 'New Test - Right Answer'
  Then I must be applying for the vacancy
  And I must see the text 'Candidato passou no teste' at candidate detail screen

@tc00009
Scenario: Create and Apply New Test - Wrong Answer
  Given that I access the job edition page
  When I edit the current job
  And create a new test called 'New Test - Wrong Answer'
  And set the yes or no question to be eliminatory
  Then I must apply 'New Test - Wrong Answer' for subscribed candidates

@tc00009 @tc00009-01
Scenario: Apply for a job with specific test
  Given that I access the job page
  When I send the register for 'New Test - Wrong Answer'
  Then I must be applying for the vacancy
  And I must see the text 'Candidato eliminado por erros' at candidate detail screen

@tc00010
Scenario: Create and Apply New Test - Rankdone
  Given that I access the job edition page
  When I edit the current job
  And create a new test called 'Rankdone'
  Then I must apply 'Rankdone' for subscribed candidates

@tc00010 @tc00010-01
Scenario: Apply for a job with specific test
  Given that I access the job page
  When I send the register for 'Rankdone'
  Then I should see a message about the 'Rankdone' test in my email box

@tc00011
Scenario: Create and Apply New Test - Mindsight
  Given that I access the job edition page
  When I edit the current job
  And create a new test called 'Mindsight'
  Then I must apply 'Mindsight' for subscribed candidates

@tc00011 @tc00011-01
Scenario: Apply for a job with specific test
  Given that I access the job page
  When I send the register for 'Mindsight'
  Then I should see a message about 'Mindsight' tests in the current screen