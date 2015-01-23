require 'bitly'

# class Bitly < ActiveRecord::Base
# 	belongs_to :link
# end


Bitly.use_api_version_3

Bitly.configure do |config|
  config.api_version = 3
  config.access_token = "f7dfc495801a8bf466ee213ceb1bce1a403e328d"
end

puts Bitly.client.shorten('http://www.google.com').inspect





# bitly = Bitly.new(username, api_key)

# bitly.shorten('http://www.google.com')
# bitly.shorten('http://www.google.com', :history => 1) # adds the url to the api user's history
# bitly.expand('wQaT')
# bitly.info('http://bit.ly/wQaT')
# bitly.stats('http://bit.ly/wQaT')

# u = bitly.shorten('http://www.google.com') #=> Bitly::Url

# u.long_url #=> "http://www.google.com"
# u.short_url #=> "http://bit.ly/Ywd1"
# u.bitly_url #=> "http://bit.ly/Ywd1"
# u.jmp_url #=> "http://j.mp/Ywd1"
# u.user_hash #=> "Ywd1"
# u.hash #=> "2V6CFi"
# u.info #=> a ruby hash of the JSON returned from the API
# u.stats #=> a ruby hash of the JSON returned from the API

# bitly.shorten('http://www.google.com', 'keyword')

