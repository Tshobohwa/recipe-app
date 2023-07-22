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

  it 'Has create food' do
    visit 'foods/new'
    expect(page).to have_content('Add food')
  end
end
