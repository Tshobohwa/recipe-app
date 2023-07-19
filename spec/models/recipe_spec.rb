require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.new(name: 'Lumbuye')
    @recipe = @user.recipes.new(user: @user, name:'gigi', preparation_time: 1.2, cooking_time: 0.5, description: "It's a cooking idea", public: true)
  end
  it 'Should be valid with all values filled' do
    expect(@recipe).to be_valid
    expect(@recipe.name).to eq('gigi')
    expect(@recipe.preparation_time).to eq(1.2)
    expect(@recipe.cooking_time).to eq(0.5)
    expect(@recipe.description).to eq("It's a cooking idea")
    expect(@recipe.public).to eq(true)
  end
end

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.new(name: 'Lumbuye')
    @recipe = @user.recipes.new(user: @user, name:'', preparation_time: '', cooking_time: '', description: '', public: '')
  end

  it 'Should be invalid if a value is missing' do
    expect(@recipe).not_to be_valid
    expect(@recipe.errors[:name]).to include("can't be blank")
    expect(@recipe.errors[:preparation_time]).to include("can't be blank")
    expect(@recipe.errors[:cooking_time]).to include("can't be blank")
    expect(@recipe.errors[:public]).to include("can't be blank")
  end

  it 'Should be invalid if a cooking_time is less than one' do  
    @recipe.cooking_time = -1 
    expect(@recipe).not_to be_valid

    @recipe.cooking_time = 0
    expect(@recipe).not_to be_valid
  end

  it 'Should be invalid if a preparation_time is less than one' do  
    @recipe.preparation_time = -1 
    expect(@recipe).not_to be_valid

    @recipe.preparation_time = 0
    expect(@recipe).not_to be_valid
  end

  it 'Should be a boolean value, public' do  
    @recipe.public = -1 
    expect(@recipe).not_to be_valid
  end
end
