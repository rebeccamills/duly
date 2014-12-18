require 'sinatra'
# require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry'
require 'sinatra/simple-authentication'
require 'rack-flash'

require_relative './models/user'
require_relative './models/link'
require_relative './config/environments'

enable :sessions

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
  login_required
  "Shorten your link"
  display shorten_link.erb
end




post '/submit' do
  login_required
  # saves it into the database
  @link = Link.new(name: params[:name], long_url: params[:long_url], user_id: current_user.id)
  if @link.save
    erb :display_link
  else
    @errors = @link.errors.full_messages
    redirect '/'
  end
end

get '/:unique_id' do
   login_required
  # redirects the user to the long URL
  @unique_id = Link.find(params[:unique_id])
  puts @unique_id.long_url
  redirect "http://#{@unique_id.long_url}"
end





