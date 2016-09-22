require 'test_helper'

class MiscTest < ActionDispatch::IntegrationTest

  setup do 
    visit root_path
  end

  test "user open root page" do
    assert has_content? 'FISH LIST'
  end

end
