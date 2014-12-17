require 'sinatra'
require 'sinatra/activerecord'
require 'pry'
require 'sinatra/simple-authentication'
require 'rack-flash'
require 'bitly'

require_relative './models/user'
require_relative './models/link'
# require_relative './config/environments'


Sinatra::SimpleAuthentication.configure do |c|
  c.use_password_confirmation = true
end

# Telling the app to use Rack::Flash
use Rack::Flash, :sweep => true

configure do
    set :template_engine, :erb # for example
end

# Telling the app to use SimpleAuthentication
register Sinatra::SimpleAuthentication

# Our first route
get '/' do
  # Require a login to enter this route, otherwise go to the login page
  login_required
  erb :index
end

get '/shorten' do
  "Shorten your link"
  display shorten_link.erb
end

get '/shorten' do
  "Your shortened URL is"
end

get '/new' do 
  erb :new_form
end

# post '/link' do
#   @ = Link.new(title: params[:title], id: params[:id])
#   puts on Submit shorten.rb
#   return Bitly.client.shorten('http://www.google.com').inspect
# end

# get '/shorten.rb' do 
#   Link.new(url: params[:url], id: params [:id])
# end 
#   puts on Submit
#   return Bitly.client.shorten('http://www.google.com').inspect
# end




enable :sessions

# binding.pry

# before do
# 	 if @current_user 
# 	 	User.create
# 	 end
# end

# class Username
# 	def username1
#   'username1'
# 	end
# end

# get '/' do
# 	@username = @current_user.username
# 	erb :index
# end






#setting up the index route
# get '/' do
#   @items = Item.all
#   erb :index
# end
#setting up the form view
# get '/new' do 
#   erb :new_form
# end
#setting up the post route for our form
# post '/new' do
#   @item = Item.new(title: params[:title], desc: params[:desc])
#   if @item.save
#     redirect '/'
#   else
#     @errors = @item.errors.full_messages
#     render '/new'
#   end
# end