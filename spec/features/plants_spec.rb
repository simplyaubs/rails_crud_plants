require 'spec_helper'

feature 'CRUD favorite plants' do
  scenario 'User can create a list of plants' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a plant'
    fill_in 'Name', with: 'Fern'
    fill_in 'Size', with: 'Medium'
    click_on 'Add plant'
    expect(page).to have_content 'Fern'
    expect(page).to have_content 'Medium'
  end
end