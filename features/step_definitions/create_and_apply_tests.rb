Given("that I access the job edition page") do
  @page.(CandidatesHome).load
  @page.(Login).login_page
end

When("I edit the current job") do
  @page.(CandidatesHome).edit_tests
end

When("create a new test called {string}") do |test_name|
  case test_name 
  when 'Rankdone'
    @page.(CandidatesHome).new_test(test_name)
    @page.(CandidatesHome).choose_rankdone_question
  when 'Mindsight'
    @page.(CandidatesHome).choose_mindsight_archetype
  else
    @page.(CandidatesHome).new_test(test_name)
    @page.(CandidatesHome).create_question('Sim ou Não', '2')
    @page.(CandidatesHome).create_question('Múltipla Escolha', '3')
    @page.(CandidatesHome).create_question('Múltipla Escolha com Peso', '4')
    @page.(CandidatesHome).create_question('Dissertativa', '5')
    @page.(CandidatesHome).create_question('Vídeo', '6')
  end
end

Given("set the expiration date of the test to {string}") do |date|
  @page.(CandidatesHome).set_expiration_date(date)
end

When("set {string} in limit time for answer each question") do |time|
  @page.(CandidatesHome).set_time_for_answer(time)
end

When("set the yes or no question to be eliminatory") do
  @page.(CandidatesHome).select_eliminatory_answer
end

Then("I must apply {string} for subscribed candidates") do |test_name|
  @page.(CandidatesHome).select_test_stage(test_name)
  page.should have_content(test_name)
end

Then("I must see the text {string} at candidate detail screen") do |text|
  @page.(CandidatesHome).load
  @page.(Login).login_page
  @page.(CandidatesHome).wait_and_click('candidates_filter')
  @page.(CandidatesHome).wait_and_set('filter', @email)
  @page.(CandidatesHome).wait_and_click('test_star', 1)
  sleep 1
  @page.(CandidatesHome).wait_and_click('test_eye')
  sleep 1
  assert_text text
end

Then("the test must be unavailable by the expired date") do
  sleep 5
  assert_text 'NEW TEST - EXPIRATION DATE'
  zx = find(:xpath, "//*[@id='root']/div/div[2]/div[2]/div[2]/span/div/span/div[2]/div/div/div[5]/div[1]/span/span[2]/span")
  zx.hover
  zy = find(:xpath, "//*[@id='root']/div/div[2]/div[2]/div[2]/span/div/span/div[2]/div/div/div[5]/div[1]/div/div").text
  p "Status of the the expired test: #{zy}"
end