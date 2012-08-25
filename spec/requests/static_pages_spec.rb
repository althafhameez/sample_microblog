require 'spec_helper'

describe "Static pages" do

	describe "Home Page" do
		it "should have the content 'Sample App'" do
			visit '/static_pages/home'
			page.should have_selector('h1',:text=>"Sample App")
			page.should have_selector('title',:text=>"Ruby on Rails Tutorial | Home")
		end
	end

	describe "Help Page" do
		it "should have the content 'Help' " do
			visit '/static_pages/help'
			page.should have_selector('h1',:text=>"Help")
			page.should have_selector('title',:text=>"Ruby on Rails Tutorial | Help")
		end
	end

	describe "About Page" do
		it "should have the content 'About Us'" do
			visit '/static_pages/about'
			page.should have_selector('h1',:text=>"About Us")
			page.should have_selector('title',:text=>"Ruby on Rails Tutorial | About Us")
		end
	end

end