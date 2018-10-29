class RegisterEmail < SitePrism::Page

  element :email, '.jss9'
  element :btn_continuar, '.jss42'

  def register_email(email_value)
    change_last_page
    wait_until_email_visible
    @email = email_value + "@mailnesia.com"
    email.set @email
    wait_until_btn_continuar_visible
    btn_continuar.click
  end
end