class RegisterEmail < SitePrism::Page

  element :email, '.jss9'
  element :btn_continuar, '.jss42'

  def register_email(email_value)
    change_last_page
    wait_load('email')
    @email = email_value + "@mailnesia.com"
    p "Email of this run: #{@email}"
    wait_and_set('email', @email)
    wait_and_click('btn_continuar')
  end
end