RSpec.describe Web::Controllers::Recipes::Create do
  let(:action) { described_class.new }
  let(:repository) { RecipeRepository.new }

  before do
    repository.clear
  end

  context 'with valid params' do
    let(:params) { Hash[recipe: 
      { 
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
      }] 
    }

    it 'creates a new recipe' do
      action.call(params)
      recipe = repository.last

      expect(recipe.id).to_not be_nil
      expect(recipe.name).to eq(params.dig(:recipe, :name))
    end

    it 'redirects the user to the recipes listing' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/recipes')
    end
  end

  context 'with invalid params' do
    let(:params_without_name) { Hash[recipe: {}] }

    it 'returns HTTP client error' do
      response = action.call(params_without_name)
      expect(response[0]).to eq(422)
    end
  
    it 'dumps errors in params' do
      action.call(params_without_name)
      errors = action.params.errors

      expect(errors.dig(:recipe, :name)).to eq(['is missing'])
    end
  end
end