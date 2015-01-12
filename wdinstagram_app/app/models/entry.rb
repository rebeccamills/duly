class Entry < ActiveRecord::Base
	validates :author, presence: true
	validates :photo_url, presence: true
end