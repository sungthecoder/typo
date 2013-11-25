require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

And /^non-admin user is set up$/ do
  User.create!({:login => 'puby',
		:password => 'ppppp',
                :email => 'puby@email.com',
                :profile_id => 2,
                :name => 'puby',
                :state => 'active'})
end

Then /^I log out$/ do
  visit '/accouts/logout'
end

Given /^I sign in as "(.*?)" with password "(.*?)"$/ do |arg1, arg2|
  visit '/accounts/login'
  fill_in 'user_login', :with => arg1 
  fill_in 'user_password', :with => arg2
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end
 
 
Then /^I should not find "(.*?)" field$/ do |arg1| 
  page.should_not have_css("input##{arg1}")
end

Then /^I should find "(.*?)" field$/ do |arg1|
  page.should have_css("input##{arg1}")
end

Then /^I fill in "(.*?)" with article id for "(.*?)"$/ do |arg1, arg2|
  article = Content.find_by_title(arg2)
  fill_in arg1, :with => article.id
end

