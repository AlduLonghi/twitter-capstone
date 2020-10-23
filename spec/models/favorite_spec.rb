require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before :each do
    @user = User.create(name: 'aldana123', email: 'aldu123@gmail.com',
                        password: '123456', password_confirmation: '123456')
    @opinion = Opinion.create(author_id: @user.id, content: 'hello, this a opinion for testing')
    @favorite = Favorite.create(opinion_id: @opinion.id, user_id: @user.id)
  end

  it { should belong_to(:user) }
  it { should belong_to(:opinion) }

  it 'returns the user who created the object' do
    expect(@favorite.user).to eql(@user)
  end

  it 'returns the opinion who recieved the favorite' do
    expect(@favorite.opinion).to eql(@opinion)
  end
end
