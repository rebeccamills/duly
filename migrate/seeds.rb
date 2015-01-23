require "sinatra"
require "sinatra/activerecord"
require "active_record"
require 'sinatra/simple-authentication'
require_relative "../config/environments"
require_relative "../models/user"
require_relative "../models/task"
require_relative "../models/list"


Users.create([
 
  { :title => "Username", :body => "Name"},
  { :title => "Link", :body => "Here is your long link"},
])

Links.create([
 
  { :title => "Short link", :description => "", :link_id => 1, :user_id => 1},
])