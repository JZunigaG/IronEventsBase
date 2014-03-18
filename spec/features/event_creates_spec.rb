require 'spec_helper'

feature 'Event creation' do

  scenario 'creating an event' do
    visit new_event_path

    fill_in "event_name", with: "Evento de prueba"
    fill_in "event_description", with: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec hendrerit tempor tellus. Donec pretium posuere tellus. Proin quam nisl, tincidunt et, mattis eget, convallis nec, purus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla posuere. Donec vitae dolor. Nullam tristique diam non turpis. Cras placerat accumsan nulla. Nullam rutrum. Nam vestibulum accumsan nisl.
"
    fill_in "event_start_at", with: "01/01/2014"
    fill_in "event_end_at", with: "02/01/2014"

    click_button "Save"

    page.should have_content "Evento de prueba"
  end

end
