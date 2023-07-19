require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Should be valid with a name' do
    user = User.new(name: 'Lumbuye')
    expect(user).to be_valid
  end

  it 'Should be invalid without a name' do
    user = User.new(name: '')
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'Should be invlid if variable is removed' do
    user = User.new()
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end
end
