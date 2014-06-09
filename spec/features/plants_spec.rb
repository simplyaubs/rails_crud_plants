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

  scenario 'User can update a plant' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a plant'
    fill_in 'Name', with: 'Fern'
    fill_in 'Size', with: 'Medium'
    click_on 'Add plant'
    expect(page).to have_content 'Fern'
    expect(page).to have_content 'Medium'
    click_on 'Fern'
    expect(page).to have_content 'Fern'
    expect(page).to have_content 'Medium'
    click_on 'Edit'
    fill_in 'Name', with: 'Venus Fly Trap'
    fill_in 'Size', with: 'Small'
    click_on 'Update plant'
    expect(page).to have_content 'Venus Fly Trap'
    expect(page).to have_content 'Small'
    expect(page).to_not have_content 'Fern'
    expect(page).to_not have_content 'Medium'
  end

  scenario 'User can delete a plant' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a plant'
    fill_in 'Name', with: 'Fern'
    fill_in 'Size', with: 'Medium'
    click_on 'Add plant'
    expect(page).to have_content 'Fern'
    expect(page).to have_content 'Medium'
    click_on 'Fern'
    expect(page).to have_content 'Fern'
    expect(page).to have_content 'Medium'
    click_on 'Delete'
    expect(page).to_not have_content 'Fern'
    expect(page).to_not have_content 'Medium'
  end
end