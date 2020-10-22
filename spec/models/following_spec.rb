require 'rails_helper'

RSpec.describe Following, type: :model do
    before :each do
        @user = User.create(id: 1, name: 'aldana', email: 'aldu@gmail.com', password: '123456', password_confirmation: '123456')
        @user2 = User.create(id: 2, name: 'aldulonghi', email: 'aldulonghi@gmail.com', password: '123456', password_confirmation: '123456')
        @opinion = Opinion.create(author_id: 1, content: 'hello, this a opinion for testing')
        @following = Following.create(followed_id: @user.id, follower_id: @user2.id)
    end

  it { should belong_to(:follower) }
  it { should belong_to(:followed) }
  
  it 'returns the user who created the object' do
    expect(@favorite.user).to eql(@user)
  end

  it 'returns the opinion who recieved the favorite' do
    expect(@favorite.opinion).to eql(@opinion)
  end
end