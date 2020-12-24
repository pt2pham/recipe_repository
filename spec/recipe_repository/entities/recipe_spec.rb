RSpec.describe Recipe, type: :entity do
  it 'can be initialized with attributes' do
    recipe = Recipe.new(
      name: "Gamjatang",
      difficulty: 4.0,
      food_type: "Korean",
      serving_size: "5",
      duration: 4*60,
      ingredients: "4cups:potatoes;10litres:water",
      instructions: "1. Some instructions yo\n 2. Some more instructions",
      notes: "do it with happiness",
      tags: "korean;soup;gamjatang;pork;pork bone soup;broth;spicy",
      image: 'https://www.ilac.com/wp-content/uploads/2019/06/placeholder-600x400.png',
    )
    expect(recipe.name).to eq('Gamjatang')
  end
end
