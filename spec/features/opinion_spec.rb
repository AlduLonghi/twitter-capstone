describe 'Opinion Creation Process', type: :feature do
    before :each do
      @user = User.create(name: 'aishalonghi', email: 'aisha@gmail.com', password: '123456', password_confirmation: '123456')
    end
  
    it 'Create a opinion' do
      visit '/users/sign_in'
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'Log in'
  
      visit root_path
      fill_in 'opinion[content]', with: 'This is my first post and this is a test post.'
      click_button 'Publish'
      expect(page).to have_content('This is my first post and this is a test post.')
    end
  
    it 'Empty opinion returns an error' do
      visit '/users/sign_in'
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'Log in'
  
      visit root_path
      fill_in 'opinion[content]', with: ''
      click_button 'Publish'
      expect(page).to have_content('can\'t be blank')
    end
  end