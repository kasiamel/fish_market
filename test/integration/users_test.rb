require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest

  setup do 
    Capybara.reset!
    visit '/login'
    @user = users(:john)
  end

  test "user logs in" do
    assert has_content? 'Log in'
    fill_in('Email', with: 'john@com.pl')
    fill_in('Password', with: 'john123')
    click_button 'Log in'
  end

end