require 'rails_helper'
require 'capybara/rspec'

RSpec.describe PublicRecipesController, type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'lumbuye', email: 'text@t.com', password: '123456')
    @user.confirm
    sign_in @user
  end
  describe 'GET #index' do
    it 'returns http success' do
      get '/public_recipes'
      expect(response).to have_http_status(:success)
    end

    it 'It returns the correct template' do
      get '/public_recipes'
      expect(response).to render_template(:index)
    end
    it 'It returns place holder from the body' do
      get '/public_recipes'
      expect(response.body).to include('Public')
    end
  end
end
