module Helpers

  def change_last_page
    page.switch_to_window(page.windows.last)
  end

  def wait_and_click(element, ind = nil)
    @count = 0
    300.times do
      Capybara.default_max_wait_time = 0.1
      p "Element #{element} is waiting for Click - #{@count}"
      @count += 1
      begin
        send("wait_for_#{element}")
        if ind == nil
          send(element).click
        else
          send(element)[ind].click
        end
        break
      rescue
        if @count == 300
          raise
        end
      end
      Capybara.default_max_wait_time = 10
    end
  end

  def wait_and_set(element, content, ind = nil)
    @count = 0
    300.times do
      Capybara.default_max_wait_time = 0.1
      p "Element #{element} is waiting for Set - #{@count}"
      @count += 1
      begin
        send("wait_for_#{element}")
        if ind == nil
          send(element).set content
        else
          send(element)[ind].set content
        end
        break
      rescue
        if @count == 300
          raise
        end
      end
      Capybara.default_max_wait_time = 10
    end
  end

  def wait_and_select(element, content, ind = nil)
    @count = 0
    300.times do
      Capybara.default_max_wait_time = 0.1
      p "Element #{element} is waiting for Select - #{@count}"
      @count += 1
      begin
        send("wait_for_#{element}")
        if ind == nil
          send(element).select content
        else
          send(element)[ind].select content
        end
        break
      rescue
        if @count == 300
          raise
        end
      end
      Capybara.default_max_wait_time = 10
    end
  end

  def wait_load(element)
    @count = 0
    300.times do
      Capybara.default_max_wait_time = 0.1
      p "Element #{element} is loading - #{@count}"
      @count += 1
      begin
        send("wait_for_#{element}")
        break
      rescue
        if @count == 300
          raise
        end
      end
      Capybara.default_max_wait_time = 10
    end
  end

end
=begin
  def wait_and_click(element, ind = nil)
    sleep 1
    send "wait_until_#{element}_visible"
    if ind == nil
    	send(element).click
    else
      send(element)[ind].click
    end
  end


  def wait_and_set(element, content, ind = nil) 
  	sleep 1
    send "wait_until_#{element}_visible"
  	if ind == nil
  		send(element).set content
  	else
  		send(element)[ind].set content
  	end
  end

  def wait_and_select(element, content, ind = nil) 
  	sleep 1
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

=end

World(Helpers)