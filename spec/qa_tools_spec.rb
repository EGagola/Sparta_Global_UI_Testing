describe 'testing the demo qa registration page' do

  before(:all) do
    @driver_class = SeleniumQaToolsForm.new
    @driver_class.visit_practice_form
    @wait = Selenium::WebDriver::Wait.new(timeout: 1)
    @firstname = 'Steven'
    @lastname = 'Seagal'
    @sex = 'sex-'
    @exp = 'exp-'
    @date = '20-04-1996'
    @profession = 'profession-'
    @tool = 'tool-'
    @continent = 'Europe'
    @command = 'Wait Commands'
    @random2 = rand(0..1)
    @random3 = rand(0..2)
    @random7 = rand(0..6)
  end

  it "should land on the registration page" do
    expect(@driver_class.current_url).to eq('http://toolsqa.com/automation-practice-form/')
  end

  it "should expect a firstname" do
    @driver_class.input_first_name_field(@firstname)
    expect(@driver_class.get_firstname_field_value).to eq @firstname
  end

  it 'should expect a last name' do
    @driver_class.input_last_name_field(@lastname)
    expect(@driver_class.get_lastname_field_value).to eq @lastname
  end

  it "should have a sex option selected" do
    @driver_class.check_male_button @random2
    expect(@driver_class.is_button_selected?(@sex, @random2)).to be TRUE
  end

  it "should have the 2 years of experience button selected" do
    random = rand(0..6)
    @driver_class.check_experience_button random
    expect(@driver_class.is_button_selected?(@exp, random)).to be TRUE
  end

  it "should only have one experience button selected at any time" do
    buttons_selected = []
    random = []
    for j in 0..2 do
      random[j] = rand(0..6)
      @driver_class.check_experience_button random[j]
      for i in 0..6 do
        if @driver_class.is_button_selected?(@exp, i)
          buttons_selected.push(1)
        end
      end
    end
    if buttons_selected == [1,1,1]
      TRUE
    end
  end

  it "should have a valid date" do
    @driver_class.input_date_field(@date)
    expect(@driver_class.is_date_valid?).to eq TRUE
  end

  it "should have a string date that matches the inputted date" do
    expect(@driver_class.get_date_field_value.class).to eq String
    expect(@driver_class.get_date_field_value).to eq @date
  end

  it "should deselect the profession buttons when clicked twice" do
    @driver_class.check_profession_box @random3
    if @driver_class.is_button_selected?(@profession, @random3)
      @driver_class.check_profession_box @random3
      expect(@driver_class.is_button_selected?(@profession, @random3)).to be FALSE
    end
  end

  it "should have a profession button selected" do
    @driver_class.check_profession_box @random3
    expect(@driver_class.is_button_selected?(@profession, @random3)).to be TRUE
  end

  it "should deselect the tool buttons when clicked twice" do
    @driver_class.check_tool_box @random3
    if @driver_class.is_button_selected?(@tool, @random3)
      @driver_class.check_tool_box @random3
      expect(@driver_class.is_button_selected?(@tool, @random3)).to be FALSE
    end
  end

  it "should have a tool button selected" do
    @driver_class.check_tool_box @random3
    expect(@driver_class.is_button_selected?(@tool, @random3)).to be TRUE
  end

  it 'should have a dropdown option selected' do
    @driver_class.select_from_dropdown('continents', @continent)
    expect(@driver_class.get_value_from('continents', @continent)).to be TRUE
  end

  it "should have a selenium command selected" do
    @driver_class.select_from_dropdown('selenium_commands', @command)
    expect(@driver_class.get_value_from('selenium_commands', @command)).to be TRUE
  end

  it "should always produce a number of either 0 or 1" do
    expect(@random2).to be_between(0,1).inclusive
  end

  it "should always produce a number between 0 and 2" do
    expect(@random2).to be_between(0,2).inclusive
  end

  it "should always produce a number between 0 and 6" do
    expect(@random2).to be_between(0,6).inclusive
  end

end
