class RegisterUser < SitePrism::Page
  element :referral, '#referral'
  element :formation, '#formacao-teste'
  element :institution, '#instituicao-teste'
  element :city, '#cidade-teste'
  element :yo_test, '#yo-test'
  element :mother_name, '#nome-da-mae', match: :first
  element :travel, '#disponibilidade-para-viagens'
  element :current_college, '#faculdade-atual'
  element :current_course, '#curso-atual'
  element :linkedIn, '#linkedin'
  element :facebook, '#facebook'
  element :document_number, '#cpf'
  element :date, '#data'
  element :experience, '#no-graduation'
  element :graduation, '#no-experience'
  element :send_button, '#send-button'
  element :password, ".jss34.jss38"
  element :agree, :xpath, "//*[@id='root']/div/div[3]/div[3]/div[4]/label/span[1]"
  element :sucess_button , '.SuccessButton'
  elements :dropdown_item, 'li' 
  elements :login_fields, ".jss34.jss9"

  def register
    wait_and_set('referral', Faker::Movie.quote)
    wait_and_set('formation', Faker::Educator.course)

    wait_and_click('institution')
    wait_and_click('dropdown_item', 0)

    wait_and_click('city')
    wait_and_click('dropdown_item', 0)

    wait_and_click('yo_test')
    wait_and_click('dropdown_item', 0)

    wait_and_set('mother_name', Faker::Name.female_first_name)

    wait_and_click('travel')
    wait_and_click('dropdown_item', 0)

    wait_and_set('linkedIn', 'linkedin.com/testetesteteste')
    wait_and_set('facebook', 'facebook.com/testestetestetestete')
    page.all('#nome-da-mae')[1].set Faker::Name.female_first_name

    wait_and_click('current_college')
    wait_and_click('dropdown_item', 0)
    
    wait_and_click('current_course')
    wait_and_click('dropdown_item', 0)

    wait_and_set('document_number', Faker::IDNumber.invalid)
    wait_and_set('date', "10/05/1993")
    wait_and_click('experience')
    wait_and_click('graduation')
    wait_and_click('send_button')
  end

  def register_first_time(mail,first_name,last_name)
    sleep 5
    wait_and_set('login_fields', mail + '@mailnesia.com', 0)
    wait_and_set('login_fields', first_name, 1)
    wait_and_set('login_fields', last_name, 2)
    wait_and_set('password', "kenoby123")
    wait_and_click('agree')
    wait_and_click('sucess_button')
  end

end