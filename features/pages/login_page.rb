class Login < SitePrism::Page

  set_url  'https://e2e.kenoby.com/#/posicoes/5b6c8d99db1d022235ae7fb6/candidatos'
  element  :email, '#email'
  element  :password, '#password'
  element  :enter, '.btn.btn-success.ng-binding'
  elements :full_name, '.name'

  def login_page
    wait_and_set('email', LOGIN['login']['email'])
    wait_and_set('password', LOGIN['login']['password'])
    wait_and_click('enter')
  end

  def find_mail
    full_name[0].text.downcase.split.join('')
  end

end