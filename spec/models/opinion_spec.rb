require 'rails_helper'

RSpec.describe Opinion, type: :model do
  before :each do
    @user = User.create(name: 'aldana', email: 'aldu@gmail.com', password: '123456', password_confirmation: '123456')
    @opinion = @user.opinions.build(content: 'hello, this a opinion for testing')
    @favorite = @opinion.favorites.build(user_id: @user.id)
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