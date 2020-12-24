RSpec.describe Web::Controllers::Recipes::Index do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:repository) { RecipeRepository.new }

  before do
    repository.clear

    @recipe = repository.create(
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
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq(200)
  end

  it 'exposes all recipes' do
    action.call(params)
    expect(action.exposures[:recipes]).to eq([@recipe])
  end
end