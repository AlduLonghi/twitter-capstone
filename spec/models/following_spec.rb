require 'rails_helper'

RSpec.describe Following, type: :model do
  before :each do
    @user = User.create(name: 'aldana', email: 'aldu000@gmail.com',
                        password: '123456', password_confirmation: '123456')
    @user2 = User.create(name: 'aldulonghijaja', email: 'aldulonghijaja@gmail.com',
                         password: '123456', password_confirmation: '123456')
    @opinion = Opinion.create(author_id: @user.id, content: 'hello, this a opinion for testing')
    @following = Following.create(followed_id: @user.id, follower_id: @user2.id)
  end

  it { should belong_to(:follower) }
  it { should belong_to(:followed) }

  it 'returns the follower' do
    expect(@following.follower).to eql(@user2)
  end

  it 'returns the followed user' do
    expect(@following.followed).to eql(@user)
  end
end
