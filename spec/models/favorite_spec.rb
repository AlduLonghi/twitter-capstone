require 'rails_helper'

RSpec.describe Favorite, type: :model do

    before :each do
        @user = User.create(id: 1, name: 'aldana', email: 'aldu@gmail.com', password: '123456', password_confirmation: '123456')
        @user1 = User.create(name: 'aldu1234', email: 'aldu123@gmail.com')
        @user2 = User.create(id: 2, name: 'aldulonghi', email: 'aldulonghi@gmail.com', password: '123456', password_confirmation: '123456')
        @opinion = @user.opinions.build(content: 'hello, this a opinion for testing')
        @favorite = @user.favorites.build(opinion_id: @opinion.id)
        @followed = Following.create(follower_id: 1, followed_id: @user2.id)
      end

  it { should belong_to(:user) }
  it { should belong_to(:opinion) }

end