class Conversation < Activerecord::Base
	belongs_to :sender, :foreign_key => :sender_id, classname: 'User'
	belongs_to :recipient, :foreign_key => :recipient_id, classname: 'User'
	
	has_many :messages,dependent: :destroy
	validates_uniqueness_of :sender_id :scope => :recipient_id

	scope :between,-> (sender_id,recipient_id) do
		where ("(conversation.sender_id = ? AND conversation.recipient_id = ?)
			OR (conversation.sender_id = ? AND conversation.recipient_id = ?)",
			sender_id,recipient_id,recipient_id,sender_id)
	end
end