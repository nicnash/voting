class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :idea
	validates_uniqueness_of :user, scope: :idea

end
