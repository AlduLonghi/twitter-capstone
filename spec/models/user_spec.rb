require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(id: 1, name: 'aldana', email: 'aldu@gmail.com', password: '123456', password_confirmation: '123456')
    @user1 = User.create(name: 'aldu1234', email: 'aldu123@gmail.com')
    @user2 = User.create(id: 2, name: 'aldulonghi', email: 'aldulonghi@gmail.com', password: '123456', password_confirmation: '123456')
    @opinion = @user.opinions.build(content: 'hello, this a opinion for testing')
    @favorite = @user.favorites.build(opinion_id: @opinion.id)
    @followed = Following.create(follower_id: 1, followed_id: @user2.id)
  end

  it { should have_many(:favorites) }
  it { should have_many(:opinions) }
  it { should have_many(:followers) }
  it { should have_many(:followed_users) }

  it 'returns created user' do
    expect(@user.id).to eql(1)
  end

  it 'returns nil because user was not created' do
    expect(@user.save).not_to be true
  end

  it 'returns opinion created by user' do
    expect(@user.opinions.first).to eql(@opinion)
  end

  it 'returns favorite object created by user' do
    expect(@user.favorites.first).to eql(@favorite)
  end

  it 'returns followed user' do
    expect(@user.followed_users.first).to eql(@user2)
  end

  it 'returns follower' do
    expect(@user2.followers.first).to eql(@user)
  end
end