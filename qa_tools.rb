require 'selenium-webdriver'
require 'date'

class SeleniumQaToolsForm

  def initialize
    @chrome_driver = Selenium::WebDriver.for :chrome
    @practice_form_url = 'http://toolsqa.com/automation-practice-form/'
    @first_name_field_name = 'firstname'
    @last_name_field_name = 'lastname'
    @sex = 'sex-'
    @experience = 'exp-'
    @date = 'datepicker'
    @profession = 'profession-'
    @tool = 'tool-'
    @continents = 'continents'
    @selenium_command = 'selenium_commands'
  end

  def visit_practice_form
    @chrome_driver.get(@practice_form_url)
  end

  def input_first_name_field text
    @chrome_driver.find_element(:name, @first_name_field_name).send_keys(text)
  end

  def get_firstname_field_value
    @chrome_driver.find_element(:name, @first_name_field_name).attribute('value')
  end

  def input_last_name_field text
    @chrome_driver.find_element(:name, @last_name_field_name).send_keys(text)
  end

  def get_lastname_field_value
    @chrome_driver.find_element(:name, @last_name_field_name).attribute('value')
  end

  def check_male_button value
    @chrome_driver.find_element(:id, @sex + value.to_s).click()
  end

  def is_button_selected? input , value
    @chrome_driver.find_element(:id, input + value.to_s).selected?
  end

  def is_date_valid?
    d, m, y = @chrome_driver.find_element(:id, @date).attribute('value').split("-")
    Date.valid_date? y.to_i , m.to_i, d.to_i
  end

  def get_date_field_value
    @chrome_driver.find_element(:id, @date).attribute('value')
  end

  def check_experience_button value
    @chrome_driver.find_element(:id, @experience + value.to_s).click()
  end

  def input_date_field text
    @chrome_driver.find_element(:id, @date).send_keys(text)
  end

  def check_profession_box value
    @chrome_driver.find_element(:id, @profession + value.to_s).click()
  end

  def check_tool_box value
    @chrome_driver.find_element(:id, @tool + value.to_s).click()
  end

  def current_url
    @chrome_driver.current_url
  end

  def select_from_dropdown input, value
    dropdown = @chrome_driver.find_element(:id, input)
    option = Selenium::WebDriver::Support::Select.new(dropdown)
    option.select_by(:text, value)
  end

  def get_value_from input , value
    if @chrome_driver.find_element(:id, input).text.include?(value)
      return TRUE
    else
      return FALSE
    end
  end

end


# test = SeleniumQaToolsForm.new
# test.visit_practice_form
# test.input_first_name_field('Steven')
# test.input_last_name_field('Seagal')
# test.check_male_button
# test.check_experience_button
# test.input_date_field('20-04-1996')
# test.check_profession_box
# test.check_tool_box
# sleep 5
