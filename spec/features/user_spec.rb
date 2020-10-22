describe 'Login process', type: :feature do
    before :each do
      @user = User.create(name: 'aldana', email: 'aldu@gmail.com', password: '123456', password_confirmation: '123456')
    end
  
    it 'Login to the app' do
      visit '/users/sign_in'
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'Log in'
      expect(page).to have_content @user.name.to_s
    end

    it 'Login failed' do
        visit '/users/sign_in'
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: ''
        click_button 'Log in'
        expect(page).to have_content 'Welcome to TwiTECH!'
      end
  
  end