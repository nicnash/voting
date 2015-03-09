class Comment < ActiveRecord::Base
	belongs_to :idea 
	belongs_to :user, :class_name => User, :foreign_key => "user_id"
end
