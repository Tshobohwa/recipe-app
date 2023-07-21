require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'ecipes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/recipes/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/recipes/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/recipes/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/recipes/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/recipes/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/recipes/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
