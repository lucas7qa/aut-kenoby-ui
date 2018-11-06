class Test < SitePrism::Page

  element  :next_step, '.btn.btn-primary.u-no-margin.ng-binding'
  element  :start_test, '.col-sm-12 > .u-margin-3.ng-scope > .text-center > .btn.u-no-margin.ng-binding'
  elements :radio_button_test, '#screening-question-has-not-multiple-choices'
  elements :check_box_test, '.ng-binding.checkboxLabel'
  element  :dissertative_question, '#screening-question-answer'
  element  :record_button, '.ba-videorecorder-theme-modern-chooser-button-0'
  element  :start_record_button, '.ba-videorecorder-theme-modern-button-primary'
  element  :finish_record_button, '.ba-videorecorder-theme-modern-button-primary '
  element  :re_record_button, '.ba-videoplayer-theme-modern-playbutton-button'
  element  :start_timed_test, '.btn.u-no-margin.ng-binding'
  element  :timed_test_dissertative_text, '.col-sm-12.u-no-margin.u-padding-1.screening-question-textarea.ng-pristine.ng-valid'
  elements :timed_test_radio_button, '.ng-binding.radioLabel'
  element  :timed_test_next_step_button, '.btn.btn-primary.u-no-margin.margin-top-20.ng-binding'
  element  :video_message, '.ba-videoplayer-message-message'
  element  :message_field, 'h1'

  def fill_tests
    change_last_page
    wait_load('next_step')
    wait_and_click('radio_button_test', 0)
    wait_and_click('radio_button_test', 2)
    wait_and_click('radio_button_test', 4)
    wait_and_set('dissertative_question', 'Default answer to dissertative question')
    wait_and_click('record_button')
    wait_and_click('start_record_button')
    sleep 10
    wait_and_click('finish_record_button')
    recursive_wait_for_video_processing(0)
    wait_and_click('next_step')
  end

  def fill_specific_tests_kenoby(scenario)
    change_last_page
    case scenario
    when "New Test - Simple"
      simple_test(scenario)
    when "New Test - Limited Time"
      timed_test
    when "New Test - Right Answer"
      simple_test(scenario)
    when 'New Test - Wrong Answer'
      test_with_wrong_answer
    end
  end

  def simple_test(scenario)
    wait_and_click('radio_button_test', 0)
    wait_and_click('radio_button_test', 2)
    wait_and_click('radio_button_test', 4)
    wait_and_set('dissertative_question', scenario)
    wait_and_click('record_button')
    wait_and_click('start_record_button')
    sleep 10
    wait_and_click('finish_record_button')
    recursive_wait_for_video_processing(0)
    wait_and_click('next_step')
  end

  def timed_test
    wait_and_click('start_timed_test')
    wait_and_click('timed_test_radio_button', 0)
    wait_and_click('timed_test_next_step_button')
    wait_and_click('timed_test_radio_button', 0)
    wait_and_click('timed_test_next_step_button')
    wait_and_click('timed_test_radio_button', 0)
    wait_and_click('timed_test_next_step_button')
    wait_and_set('timed_test_dissertative_text', 'timed test answer')
    wait_and_click('timed_test_next_step_button')
    wait_and_click('record_button')
    wait_and_click('start_record_button')
    sleep 10
    wait_and_click('finish_record_button')
    recursive_wait_for_video_processing(0)
    wait_and_click('next_step')
  end

  def test_with_wrong_answer
    wait_load('next_step')
    wait_and_click('radio_button_test', 1)
    wait_and_click('radio_button_test', 2)
    wait_and_click('radio_button_test', 4)
    wait_and_set('dissertative_question', 'wrong answer test')
    wait_and_click('record_button')
    wait_and_click('start_record_button')
    sleep 10
    wait_and_click('finish_record_button')
    recursive_wait_for_video_processing(0)
    wait_and_click('next_step')
  end

  def init_second_test
    wait_until_start_test_visible
    start_test.click
  end

  def recursive_wait_for_video_processing(show_count)
    sleep 1
    begin
      re_record_button
      show_count += 1
      if show_count <= 1
         recursive_wait_for_video_processing(show_count)
      end
    rescue
      if show_count <= 2
         recursive_wait_for_video_processing(show_count)
      else
         show_count = 0
      end
    end
  end

  def assert_message
    sleep 5
    wait_load('message_field')
    assert_text 'Teste finalizado, boa sorte em seu processo de candidatura!'
  end

end