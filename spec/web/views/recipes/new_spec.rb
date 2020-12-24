RSpec.describe Web::Views::Recipes::New do
  let(:params)    { OpenStruct.new(valid?: false, error_messages: ['Name must be filled']) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/recipes/new.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    expect(rendered).to include('There was a problem with your submission')
    expect(rendered).to include('Name must be filled')
  end
end