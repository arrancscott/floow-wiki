require 'spec_helper'

feature "The Floow Wiki" do

	before(:each) do
	  # Valid user on a plan
	  FactoryGirl.create(:user)
	end

	def login(email)
		visit '/login'
		fill_in :email, with: email
		fill_in :password, with: 'monkey'
		click_button 'Login'
	end

	scenario "Logging in should redirect to the articles index page" do
		login('some@one.com')
		expect(current_path).to eq(articles_path)
	end

	scenario "User creates an account, should be able to create an article" do
		login('some@one.com')
		click_link 'New Article'
		expect(current_path).to eq(new_article_path)
		fill_in 'article_title', with: 'My First Article'
		fill_in 'article_content', with: 'This is just a piece of content'
		click_button 'Create Article'
		expect(page).to have_text 'Article was successfully created.'
	end

	scenario 'User should be able to login, create an article and then view it' do
		login('some@one.com')
		click_link 'New Article'
		expect(current_path).to eq(new_article_path)
		fill_in 'article_title', with: 'My First Article'
		fill_in 'article_content', with: 'This is just a piece of content'
		click_button 'Create Article'
		expect(page).to have_text 'Article was successfully created.'
		click_link 'My Articles'
		click_link 'Show'
	end

	scenario 'User should be able to login, create an article and then delete it' do
		login('some@one.com')
		click_link 'New Article'
		expect(current_path).to eq(new_article_path)
		fill_in 'article_title', with: 'My First Article'
		fill_in 'article_content', with: 'This is just a piece of content'
		click_button 'Create Article'
		expect(page).to have_text 'Article was successfully created.'
		click_link 'My Articles'
		click_link 'Destroy'
	end

	scenario 'User should be able to login, create an article and then delete it' do
		login('some@one.com')
		click_link 'New Article'
		expect(current_path).to eq(new_article_path)
		fill_in 'article_title', with: 'My First Article'
		fill_in 'article_content', with: 'This is just a piece of content'
		click_button 'Create Article'
		expect(page).to have_text 'Article was successfully created.'
		click_link 'My Articles'
		click_link 'Edit'
	end

end