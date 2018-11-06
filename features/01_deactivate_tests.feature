@deactivate_tests
Feature: Deactivate Tests

@delete_kenoby @tc00001 @tc00003 @tc00004 @tc00005 @tc00006 @tc00007 @tc00008 @tc00009
Scenario: Clear Tests
  Given that I access the job edition page
  When I edit the current job
  And deactivate all the 'Kenoby' tests with status 'Fase: Inscrição Inicial'
  Then I must delete the tests containing 'New Test' in title

@delete_rankdone @tc00010
Scenario: Clear Tests
  Given that I access the job edition page
  When I edit the current job
  And deactivate all the 'Rankdone' tests with status 'Fase: Inscrição Inicial'
  Then I must delete the tests containing 'Rankdone' in title

@delete_mindsight @tc00011
Scenario: Clear Tests
  Given that I access the job edition page
  When I edit the current job
  Then deactivate all the 'Mindsight' tests with status 'Fase: Inscrição Inicial'