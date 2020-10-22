require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(id: 1, name: 'aldana', email: 'aldu@gmail.com', password: '123456', password_confirmation: '123456')
    @user1 = User.create(name: 'aldu1234', email: 'aldu123@gmail.com')
    @opinion = @user.opinions.build(content: 'hello, this a opinion for testing')
    @favorite = @user.favorites.build(opinion_id: @opinion.id)
  end

  it { should have_many(:favorites) }
  it { should have_many(:opinions) }
  it { should have_many(:followers) }
  it { should have_many(:followed_users) }

  it 'returns created user' do
    expect(@user.id).to eql(1)
  end

  it 'returns nil because user was not created' do
    expect(@user1.id).to eql(nil)
  end

  it 'returns nil because user was not created' do
    expect(@user1.id).to eql(nil)
  end
end