module Helpers

  def change_last_page
    page.switch_to_window(page.windows.last)
  end

  def wait_and_click(element, ind = nil)
  	sleep 0.3
    send "wait_until_#{element}_visible"
  	if ind == nil
		send(element).click
	else
  		send(element)[ind].click
  	end
  end

  def wait_and_set(element, content, ind = nil) 
  	sleep 0.3
    send "wait_until_#{element}_visible"
  	if ind == nil
  		send(element).set content
  	else
  		send(element)[ind].set content
  	end
  end

  def wait_and_select(element, content, ind = nil) 
  	sleep 0.3
    send "wait_until_#{element}_visible"
  	if ind == nil
  		send(element).select content
	else
  		send(element)[ind].select content
  	end
  end

  def wait_load(element)
    begin
      send("wait_until_#{element}_visible")
    rescue
      wait_load(element)
    end
  end

end

World(Helpers)