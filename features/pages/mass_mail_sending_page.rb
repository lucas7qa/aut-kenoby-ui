class MassMailSending < SitePrism::Page

  set_url "http://mailnesia.com/"

  element  :email, '#mailbox'
  elements :first_email_second_stage, '.emailheader'
  element  :sorted_candidates_checkbox, '#Triados'
  element  :test_reminder_envelop, '.fa.fa-envelope-o'
  element  :mail_envelop, '.fa.fa-envelope'
  element  :mail_model, '#message-template'
  element  :pop_up_status, 'h2'
  element  :confirm_button, '.confirm'
  element  :mail_subject, '#focusedInput'
  element  :mail_body_frame, '#ui-tinymce-1_ifr'
  element  :mail_body, '#tinymce'
  element  :send_mail_button, '.btn.btn-success'
  element  :checkbox_send_to_all, 'div > p:nth-child(3) > label > input'

  def send_test_reminder
    sleep 5
    wait_and_click('sorted_candidates_checkbox')
    wait_and_click('test_reminder_envelop')
    recursive_status_check
  end

  def recursive_status_check
    sleep 5
    if pop_up_status.text == 'Enviando'
      recursive_status_check
    else
      wait_and_click('confirm_button')
    end 
  end

  def send_mail(text_body)
    wait_and_click('sorted_candidates_checkbox')
    wait_and_click('mail_envelop')
    wait_and_set('mail_subject', text_body)
    within_frame(mail_body_frame) do wait_and_set('mail_body', text_body) end
    wait_and_click('send_mail_button')
    wait_load('pop_up_status')
    recursive_status_check
  end

  def send_model_mail(template)
    wait_and_click('sorted_candidates_checkbox')
    wait_and_click('mail_envelop')
    wait_and_select('mail_model', template)
    wait_and_click('checkbox_send_to_all')
    wait_and_click('send_mail_button')
    wait_load('pop_up_status')
    recursive_status_check
  end

  def reply_mail(text_body)
    uri_get = "http://qamail.ala.se/api/show_mailbox_content?session_key=Ec4XYGvXjTnMze19z3KfeNVa&address=inhlq2g@qamail.ala.se"
    @get_mailbox = HTTParty.get(uri_get, :headers => {"Content-Type" => "application/json", "accept" => "application/json"})

    loop do
      if @get_mailbox['mailbox']['letter'] == nil
         @get_mailbox = HTTParty.get(uri_get, :headers => {"Content-Type" => "application/json", "accept" => "application/json"})
      else
        message = text_body + ', id: ' + @get_mailbox['mailbox']['letter'][0]['id']
        uri_post = "http://qamail.ala.se/send_reply?from_address=inhlq2g@qamail.ala.se&message=#{message}&sender=Automation&session_key=Ec4XYGvXjTnMze19z3KfeNVa&subject=RE+&to=pockenoby@gmail.com"
        post_mailbox = HTTParty.post(uri_post, :headers => {"Content-Type" => "application/json", "accept" => "application/json"})
        p "Message Sent with content: #{message}"
        break
      end
    end

  end

end