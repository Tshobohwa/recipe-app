require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.create(name: 'Lumbuye', email: 'test@g.com', password: '123456')
    @food = @user.foods.new(name: 'potato', measurement_unit: 'kg', price: 12, quantity: 3)
  end

  it 'Should be valid with all values filled' do
    expect(@food).to be_valid
    expect(@food.name).to eq('potato')
    expect(@food.measurement_unit).to eq('kg')
    expect(@food.price).to eq(12)
    expect(@food.quantity).to eq(3)
  end
end

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.new(name: 'Lumbuye')
    @food = @user.foods.new(name: '', measurement_unit: '', price: '', quantity: '')
  end

  it 'Should be invalid if a value is missing' do
    expect(@food).not_to be_valid
    expect(@food.errors[:name]).to include("can't be blank")
    expect(@food.errors[:measurement_unit]).to include("can't be blank")
    expect(@food.errors[:price]).to include("can't be blank")
    expect(@food.errors[:quantity]).to include("can't be blank")
  end
end
