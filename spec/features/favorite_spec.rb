describe 'Favorite Process', type: :feature do
  before :each do
    @user = User.create(name: 'estebanlonghi99', email: 'estebanjaja@gmail99.com',
                        password: '123456', password_confirmation: '123456')
    @user2 = User.create(name: 'cecilialonghi99', email: 'ceciliasota@gmail99.com',
                         password: '123456', password_confirmation: '123456')
    @opinion = Opinion.create(author_id: @user2.id, content: 'hi this is a opinion test')
  end

  it 'Favorite opinion' do
    visit '/users/sign_in'
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'

    visit user_path(@user2)
    find(:css, '.fav-link').click
    visit favorites_path(user_id: @user.id)
    expect(page).to have_content 'hi this is a opinion test'
  end
end
