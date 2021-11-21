class Message < ActiveRecord::Base
	belongs_to :conversations
	belongs_to :user

	validates_presence_of :body,:conversations_id,:user_id

	def message_time
		created_at.strftime("%m/%d/%y at %l:%M %p")
	end
end