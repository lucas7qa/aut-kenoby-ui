class CandidatesHome < SitePrism::Page

  set_url 'https://e2e.kenoby.com/#/posicoes/5b6c8d99db1d022235ae7fb6/progresso'
  element  :filter, :xpath, '//*[@id="filters"]/div/div[4]/div/div/div/textarea'
  element  :screening_first_candidate, '.triage-button'
  element  :progress_bar, :xpath, '/html/body/div[3]/div[2]/div/div[1]/form/div/div/ul[1]/li[3]/a'
  element  :filter_progress_bar, 'input[placeholder="Nome do candidato..."]'
  element  :options_candidate, '.btn.btn-xs.btn-default.btn-elipsis'
  element  :incompatible_candidate, :xpath, '//*[@id="board"]/div/div[1]/div[2]/div[2]/progress-card/div/div/div/div/div[1]/div[2]/div[1]/div/ul/li[4]/a'
  element  :reason, '.form-control-new.ng-scope.ng-pristine.ng-invalid.ng-invalid-required'
  elements :add_anotation_candidate, '.ng-binding.ng-scope > input[type="checkbox"]'
  element  :model_email, 'select[placeholder="Modelo"]'
  element  :confirm_button, '.btn.btn-success'
  element  :triados, '.bottom.row'
  element  :abordados, '#board > div > div:nth-child(2) > div.content-card__section.mappings-on-stage.ng-scope.stage-5b6c8d99db1d022235ae7fb9'
  element  :role_configuration, '#configuration-button'
  element  :edit_position, '#edit-position-button'
  element  :edit_test, '#position-list-test-button'
  element  :edit_test_2, '#position-list-second-test-button'
  element  :new_test_button, '#screening-add-new-group-button'
  element  :test_kenoby, '#radioKenoby'
  element  :test_rankdone, '#radioRankdone'
  element  :confirm_test_button, '.confirm'
  element  :test_name, '.edit-name.ng-scope.ng-isolate-scope.ng-pristine.ng-valid'
  element  :confirm_test, '.glyphicon.glyphicon-ok.ng-scope'
  element  :test_stage_kenoby, '#screening-add-single-to-stage'
  element  :test_stage_rankdone, '#screening-add-to-stage'
  element  :test_stage_mindsight, '#screening-add-to-stage-select-current-stage'
  element  :new_question, '#screening-question-detail-link'
  element  :question_type, '#screening-question-kind'
  element  :frame_question, '#ui-tinymce-2_ifr'
  element  :question_body, '#tinymce'
  element  :cant_fail_question, '#screening-question-cannot-fail-true'
  element  :right_answer, '#screnning-question-is-correct', match: :first
  element  :save_button, '#screening-question-save-button'
  element  :close_test, '.x-close.pull-right'
  element  :limit_test_duration, '#screening-is-timed-test'
  element  :expiration_date_switch, '#screening-expire-test'
  element  :expiration_date_field, '.datepicker-popup.form-control-new.ng-isolate-scope.ng-dirty.ng-valid.ng-valid-date'
  element  :expiration_date, '.datepicker-popup.form-control-new.ng-isolate-scope.ng-pristine.ng-valid.ng-valid-date'
  element  :navbar, '#navbar'
  element  :iframe_question_text_2, '#ui-tinymce-2_ifr'
  element  :iframe_question_text_3, '#ui-tinymce-3_ifr'
  element  :iframe_question_text_4, '#ui-tinymce-4_ifr'
  element  :iframe_question_text_5, '#ui-tinymce-5_ifr'
  element  :iframe_question_text_6, '#ui-tinymce-6_ifr'
  elements :company_test, '.category-header'
  elements :question_select_rankdone, '.u-no-margin.btn.btn-success.btn-xs.select-rankdone-btn.ng-binding'
  element  :archetype_dropdown, :xpath, "//*[@id='position-mindsight']/div/div[1]/span/span[1]"
  elements :archetype_option, '.ui-select-choices-row-inner'
  elements :label_test, '.pull-left.truncate.group-name.ng-binding.ng-scope'
  element  :candidates_filter, '#filter-applicants-link'
  elements :test_star, '.fa.fa-star' 
  element  :test_eye, '.fa.fa-eye.u-font-size-15.cursor-pointer.u-link-blue' 
  
  def choose_mindsight_archetype
    wait_and_click('company_test', 0)
    wait_and_click('company_test', 1)
    wait_and_click('label_test', 0)
  end

  def select_eliminatory_answer
    question_edit = page.all('#edit-question-details')[0]
    question_edit.click
    wait_and_click('cant_fail_question')
    wait_and_click('save_button')
  end

  def set_expiration_date(date)
    wait_and_click('expiration_date_switch')
    wait_and_click('expiration_date')
    wait_and_set('expiration_date', '01/09/2018')
  end

  def set_time_for_answer(time)
    wait_and_click('limit_test_duration')
    timer = page.all('.col-sm-12.u-no-padding.u-no-margin.ng-scope.ng-pristine.ng-valid')

    timer.each do | time_to_answer |
      time_to_answer.select(time)
    end

  end

  def edit_tests
    wait_and_click('role_configuration')
    wait_and_click('edit_position')

    Capybara.default_max_wait_time = 1

    begin
      wait_and_click('archetype_dropdown')
      wait_and_click('archetype_option', 0)
    rescue
    end
    
    begin
      wait_and_click('edit_test')
    rescue
      wait_and_click('edit_test_2')
    end

    Capybara.default_max_wait_time = 10
  end

  def recursive_new_test(test_name)
    begin
      wait_and_click(test_name)
      wait_and_click('confirm_test_button')
    rescue
      new_test_button.click
      recursive_new_test(test_name)
    end
  end

  def new_test(test_name)

    if test_name == 'Rankdone'
        recursive_new_test('test_rankdone')
        wait_and_click('company_test', 0)
        wait_and_click('company_test', 2)
    else
        recursive_new_test('test_kenoby')
    end

    wait_load('test_name')
    wait_and_set('test_name', test_name)
    wait_and_click('confirm_test')
  end

  def choose_rankdone_question
    wait_and_click('question_select_rankdone', 0)
  end

  def select_test_stage(test_name)
      case test_name 
        when 'Rankdone'
          wait_and_select('test_stage_rankdone','Inscrição Inicial')
        when 'Mindsight'
          wait_and_select('test_stage_mindsight','Inscrição Inicial')
        else
          wait_and_select('test_stage_kenoby','Inscrição Inicial')
        end
      sleep 1
    wait_and_click('close_test')
    wait_and_click('navbar')
    click_button("Salvar")
  end

  def create_question(type, selector_number)
    wait_and_click('new_question')
    wait_and_select('question_type', type)

    case selector_number
    when "2"
      within_frame(iframe_question_text_2) do wait_and_set('question_body', type) end
    when "3"
      within_frame(iframe_question_text_3) do wait_and_set('question_body', type) end
    when "4"
      within_frame(iframe_question_text_4) do wait_and_set('question_body', type) end
    when "5"
      within_frame(iframe_question_text_5) do wait_and_set('question_body', type) end
    when "6"
      within_frame(iframe_question_text_6) do wait_and_set('question_body', type) end
    end

    Capybara.default_max_wait_time = 0.1

    begin
      wait_and_click('right_answer')
    rescue
    end

    begin
      right_answer_2 = '#screening-questions-isCorrect-true'
      multiple_choice_text = '#screening-question-fill-next'
      page.all(right_answer_2)[0].click
      page.all(multiple_choice_text)[0].set type
      page.all(multiple_choice_text)[1].set type
    rescue
    end

    Capybara.default_max_wait_time = 10

    wait_and_click('save_button')
  end

  def screening_candidate(email)
    wait_and_set('filter', email)
    wait_and_click('screening_first_candidate')
    wait_and_click('progress_bar')
    wait_and_set('filter_progress_bar', email + "@mailnesia.com")

    loop do
      begin
        page.driver.browser.execute_script("var dm = document.createElement('script'); dm.src='https://andywer.github.io/drag-mock/drag-mock.min.js'; document.head.appendChild(dm) ; var dragSource = document.querySelector('#applicant-card'); var dropTarget = document.querySelector('#abordados'); window.dragMock.dragStart(dragSource).delay(100).dragOver(dropTarget).delay(100).drop(dropTarget);")
        break
      rescue
      end
    end

  end

  def disabled_candidate(email)
    wait_and_set('filter', email)
    wait_and_click('screening_first_candidate')
    wait_and_click('progress_bar')
    wait_and_set('filter_progress_bar', email + "@mailnesia.com")
    change_last_page
    wait_and_click('options_candidate')
    wait_and_click('incompatible_candidate')
    reason_candidate_incompatible
    send_email
  end

  def reason_candidate_incompatible
    wait_and_select('reason','Motivo 01')
    wait_and_click('add_anotation_candidate', 0)
    iframe_anotation = find('#ui-tinymce-1_ifr')
    within_frame(iframe_anotation) do
      find('#tinymce').set "Candidato Incompatível"
    end
  end

  def send_email
    wait_and_select('model_email','Modelo Teste')
    wait_and_click('confirm_button')
  end

end