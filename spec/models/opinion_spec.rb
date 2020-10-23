require 'rails_helper'

RSpec.describe Opinion, type: :model do
  before :each do
    @user = User.create(name: 'aldana', email: 'alduabril@gmail.com',
                        password: '123456', password_confirmation: '123456')
    @opinion = Opinion.create(content: 'hello, this a opinion for testing', author_id: @user.id)
    @favorite = Favorite.create(user_id: @user.id, opinion_id: @opinion.id)
  end

  it { should have_many(:favorites) }
  it { should belong_to(:author) }

  it 'returns favorite in opinion' do
    expect(@opinion.favorites.first).to eql(@favorite)
  end

  it 'returns author name' do
    expect(@opinion.author.name).to eql(@user.name)
  end
end
