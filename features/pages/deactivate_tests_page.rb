class DeactivateTests < SitePrism::Page

  elements :label_phase, '.u-padding-right-1.ng-binding'
  elements :label_test, '.pull-left.truncate.group-name.ng-binding.ng-scope'
  element  :delete_test, '.btn.btn-danger.btn-trash.ng-isolate-scope'
  element  :confirm_delete, '.confirm'
  element  :close_test, '.x-close.pull-right'
  element  :navbar, '#navbar'
  element  :cogwheel, '.dropdown.pull-right.group-edit.ng-scope'
  element  :trashcan, '.fa.fa-trash'
  elements :company_test, '.category-header'

  def find_active_test(company_name, test_phase)
    sleep 3
    if company_name == 'Rankdone'
        wait_and_click('company_test', 0)
        wait_and_click('company_test', 2)
    end

    if company_name == 'Mindsight'
        wait_and_click('company_test', 0)
        wait_and_click('company_test', 1)
    end

    label_phase.each do |phase| 
      if phase.text == test_phase
          sleep 1
          wait_and_click('label_phase', 0)
          sleep 1
          wait_and_click('delete_test')
          sleep 1
          wait_and_click('confirm_delete')
          sleep 3
      end
    end

    wait_and_click('close_test')
    sleep 1
    wait_and_click('navbar')
    sleep 1
    click_button("Salvar")
    sleep 3
  end

  def delete_tests(test_name)
    sleep 3
    if test_name == 'Rankdone'
        wait_and_click('company_test', 0)
        wait_and_click('company_test', 2)
    end
    
    label_test.each do |test_line|
      if test_line.text.include? test_name.upcase
          sleep 1
        test_line.click
          sleep 1
        cogwheel.hover
          sleep 1
        trashcan.click
          sleep 1
        confirm_delete.click
          sleep 5
      end
    end
    wait_and_click('close_test')
    wait_and_click('navbar')
    click_button("Salvar")
  end

end