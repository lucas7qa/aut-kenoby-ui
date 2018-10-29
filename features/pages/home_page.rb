class Home < SitePrism::Page
  
  set_url 'https://jobse2e.kenoby.com/instacarro-old/job/teste-automatizacao/5b6c8d99db1d022235ae7fb6'

  element :curriculum, '.send-your-resume'
  
  def access_job
    curriculum.click
    change_last_page
  end

end