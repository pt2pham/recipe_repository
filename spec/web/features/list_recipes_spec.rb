require 'features_helper'

RSpec.describe 'List recipes' do
  let(:repository) { RecipeRepository.new }
  before do
    repository.clear

    repository.create(
      name: "Gamjatang",
      difficulty: 3.0,
      food_type: "Korean",
      serving_size: "5",
      duration: 4*60,
      ingredients: "4cups:potatoes;10litres:water",
      instructions: "1. Some instructions yo\n 2. Some more instructions",
      notes: "do it with happiness",
      tags: "korean;soup;gamjatang;pork;pork bone soup;broth;spicy",
      image: 'https://www.ilac.com/wp-content/uploads/2019/06/placeholder-600x400.png',
    )
    repository.create(
      name: "Tiramisu",
      difficulty: 4.0,
      food_type: "Dessert",
      serving_size: "4",
      duration: 3*60,
      ingredients: "1cup;mascarpone cheese;1tsp;coffee",
      instructions: "1. Some instructions yo\n 2. Some more instructions",
      notes: "Michelle is the master of dis one",
      tags: "dessert;yummy;coffee;tiramisu",
      image: 'https://www.ilac.com/wp-content/uploads/2019/06/placeholder-600x400.png',
    )
  end

  it 'displays each recipe on the page' do
    visit '/recipes'

    within '#recipes' do 
      expect(page).to have_selector('.recipe', count: 2), 'Expected to find 2 recipes'
    end
  end
end