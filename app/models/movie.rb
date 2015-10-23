class Movie < ActiveRecord::Base
	attr_reader	:title, :rating, :description, :release_date
	attr_writer	:title, :rating, :description, :release_date
end
