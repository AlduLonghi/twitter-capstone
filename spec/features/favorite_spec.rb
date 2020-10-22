describe 'Favorite Process', type: :feature do
    before :each do
      @user = User.create(name: 'estebanlonghi7', email: 'estebanjaja@gmail1.com', password: '123456', password_confirmation: '123456')
      @user2 = User.create(name: 'cecilialonghi7', email: 'ceciliasota@gmail.com', password: '123456', password_confirmation: '123456')
      @opinion = Opinion.create(author_id: @user2.id, content: 'hi this is a opinion test')
    end
  
    it 'Favorite opinion' do
      visit '/users/sign_in'
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'Log in'
      
      visit user_path(@user2)
      find(:css, 'fa.fa-heart.grey-color').click
      expect(page).to have_css("fa.fa-heart.red-color")
    end

  end