class Mailinator < SitePrism::Page

  set_url "http://mailnesia.com/"

  element  :email, '#mailbox'
  element  :enter, '#sm'
  element  :first_email, '.emailheader'
  element  :link_email_job, '.emails > .body > .boxcontent > .pill-content > .active > .body > tbody > tr > .container > .content > .main > tbody > tr > .wrapper > table > tbody > tr > td > .btn.btn-primary > tbody > tr > td'
  elements :first_email_second_stage, '.emailheader'
  element  :confirm, :xpath, '/html/body/table/tbody/tr/td[2]/div/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/table/tbody/tr/td/a'
  element  :mail_subject, '.email'

  def open_mailbox(email_value)
    wait_and_set('email', email_value)
    wait_and_click('enter')
  end

  def show_email
    wait_and_click('first_email')
    wait_and_click('link_email_job')
  end

  def show_email_second_stage
    wait_and_click('first_email_second_stage', 0)
    click_link('Iniciar Testes')
  end

  def assert_on_email(company)
    assert_text company
  end

  def show_email_candidate_incompatible
    wait_and_click('first_email_second_stage', 0)
  end

end