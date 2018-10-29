class CurrentVacancy < SitePrism::Page

  element :vacancy, :xpath, '//*[@id="root"]/div/div[2]/div/div[1]/div/div/div/div/div/div[1]/ul/div/div[2]/h3'
  element :test, :xpath, '//*[@id="root"]/div/div[2]/div/div[2]/span/div/span/div[2]/div/div/div[5]/div/div/div/div/div/button/span[1]'

  def enter_vacancy
    wait_until_vacancy_visible
    vacancy.click
    wait_until_test_visible
    test.click
    change_last_page
  end


end