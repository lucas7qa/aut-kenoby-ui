class CurrentJob < SitePrism::Page

  element :job, :xpath, '//*[@id="root"]/div/div[2]/div/div[1]/div/div/div/div/div/div[1]/ul/div/div[2]/h3'
  element :test, '#start-test'
  element :second_test, '#start-test', match: :first

  def enter_job(scenario)
    wait_and_click('job')
    if scenario != 'New Test - Expiration Date'
      if scenario != 'Rankdone' && scenario != 'Mindsight'
        wait_and_click('test')
      end
    end
  end

  def enter_second_test
    wait_until_second_test_visible
    second_test.click
  end

end