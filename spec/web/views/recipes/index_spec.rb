RSpec.describe Web::Views::Recipes::Index, type: :view do
  let(:exposures) { Hash[recipes: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/recipes/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #recipes' do
    expect(view.recipes).to eq exposures.fetch(:recipes)
  end

  context 'when there are no recipes' do
    it 'shows a placeholder message' do
      expect(rendered).to include('<p class="placeholder">There are no recipes yet.</p>')
    end
  end
  
  context 'when there are recipes' do
    let(:recipe1) { 
      Recipe.new(
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
    }
    let(:recipe2) { 
      Recipe.new(
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
    }
    let(:exposures) { Hash[recipes: [recipe1, recipe2]] }

    it 'lists them all' do
      expect(rendered.scan(/class="recipe"/).length).to eq(2)
      expect(rendered).to include('Gamjatang')
      expect(rendered).to include('Tiramisu')
    end

    it 'hides the placeholder message' do
      expect(rendered).to_not include('<p class="placeholder">There are no recipes yet.</p>')
    end
  end
end
