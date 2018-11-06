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
#    if company_name == 'Rankdone'
#        wait_and_click('company_test', 0)
        wait_and_click('company_test', 2)
 #   end

  #  if company_name == 'Mindsight'
  #      wait_and_click('company_test', 0)
        wait_and_click('company_test', 1)
    #end

   # wait_and_click('company_test', 0)
   # wait_and_click('company_test', 0)

    label_phase.each do |phase| 
      if phase.text == test_phase
         sleep 1
         wait_and_click('label_phase', 0)
         sleep 1
         wait_and_click('delete_test')
         sleep 1
         confirm_delete.click
         sleep 5
      end
    end

    wait_and_click('close_test')
    wait_and_click('navbar')
    click_button("Salvar")
  end

  def delete_tests(test_name)
    if test_name == 'Rankdone'
       wait_and_click('company_test', 0)
       wait_and_click('company_test', 2)
    end
    
    wait_and_click('company_test', 0)
    wait_and_click('company_test', 0)

    wait_load('label_test')

    label_test.each do |test_line|
      if test_line.text.include? test_name.upcase
         sleep 1
         test_line.click
         sleep 1
         cogwheel.hover
         sleep 1
         wait_and_click('trashcan')
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