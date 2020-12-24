require 'features_helper'

RSpec.describe 'Add a recipe' do
  after do
    RecipeRepository.new.clear
  end

  it 'can create a new recipe' do
    visit '/recipes/new'

    within 'form#recipe-form' do
      fill_in 'Name',  with: 'Name of your recipe'
      fill_in 'Difficulty', with: 'A difficulty rating from 0-5'
      fill_in 'Food Type', with: 'The type of dish'
      fill_in 'Serving Size', with: 'Number of people'
      fill_in 'Duration', with: 'Cooking/prep time'
      fill_in 'Ingredients', with: 'List of ingredients'
      fill_in 'Instructions', with: 'Numbered instructions'
      fill_in 'Notes', with: 'Any special notes to be aware of'
      fill_in 'Tags', with: 'Tags'
      fill_in 'Image', with: 'Upload a Thumbnail for the recipe'
      
      click_button 'Create'
    end

    expect(page).to have_current_path('/recipes')
    expect(page).to have_content('Example recipe')
  end
end