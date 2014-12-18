<<<<<<< HEAD
require 'sinatra'
require 'sinatra/reloader'
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








#From Bucket List exercise...setting up the index route
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
# end





# get '/shorten' do
#   "Your shortened URL is"
# end

# get '/new' do 
#   erb :new_form
# end

post '/shorten' do # when the form is submitted to '/shorten'
  Bitly.use_api_version_3

Bitly.configure do |config|
  config.api_version = 3
  config.access_token = "f7dfc495801a8bf466ee213ceb1bce1a403e328d"
end

puts Bitly.client.shorten('http://www.google.com').inspect

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

# def shorten(input, opts={})
#   if input.is_a? String
#     request = create_url("shorten", :longUrl => input, :history => (opts[:history] ? 1 : nil))
#     result = get_result(request)
#     result = {:long_url => input}.merge result[input]
#     Bitly::Url.new(@login,@api_key,result)
#   elsif input.is_a? Array
#       request = create_url("shorten", :history => (opts[:history] ? 1 : nil))
#       request.query << "&" + input.map { |long_url| "longUrl=#{CGI.escape(long_url)}" }.join("&") unless input.nil?
#       result = get_result(request)
#       input.map do |long_url|
#         new_url = {:long_url => long_url}.merge result[long_url]
#         long_url = Bitly::Url.new(@login,@api_key,new_url)
#   end
#     else
#       raise ArgumentError.new("Shorten requires either a url or an array of urls")
#     end
#   end





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
=======
require 'pg'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  database: 'tags_db'
)

class User < ActiveRecord::Base
	has_many :posts
end 

class Post < ActiveRecord::Base
	belongs_to :user
	has_many :taggings
	has_many :tags, through: :taggings
end

class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :posts, through: :taggings
end

class Tagging < ActiveRecord::Base
	belongs_to :tag 
	belongs_to :post 
end

binding.pry
>>>>>>> ee04e67b06d7632b638bc24b990157043ede60e5
