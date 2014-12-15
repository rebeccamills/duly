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
