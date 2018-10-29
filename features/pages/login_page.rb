class Login < SitePrism::Page

  set_url 'https://e2e.kenoby.com/#/posicoes/5b6c8d99db1d022235ae7fb6/candidatos'
  element :email, '#email'
  element :password, '#password'
  element :enter, '.btn.btn-success.ng-binding'

  def login_page
    wait_until_email_visible
    email.set LOGIN['login']['email']
    password.set LOGIN['login']['password']
    enter.click
  end

end