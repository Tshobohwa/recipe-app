
require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Recipes index', type: :view do
  include Capybara::DSL
  include Devise::Test::IntegrationHelpers 
  before do
    @user = User.create(name: 'lumbuye', email: 'text@t.com', password: '123456')
    @user.confirm
    sign_in @user
  end

  it 'Has create recipe' do
    recipe = Recipe.create(user: @user, name: 'test', preparation_time: 1, cooking_time: 1, description: 'This description', public: true )
    visit "recipes/#{ recipe.id }"
    expect(page).to have_content('Preparation')
    expect(page).to have_content(recipe.name)
  end
end

