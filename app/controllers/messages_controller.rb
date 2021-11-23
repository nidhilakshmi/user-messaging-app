class MessagesController < ActionController

	before_action do
		@conversation = Conversation.find(params[:conversation_id])
	end

	def index
		@messages =@conversation.message
		@message = @conversation.message.new
	end

	def new
		@message =@conversation.messages.new
	end

	def create
		@message =@conversation.messages.new(messages_params)
		if message.save
			redirect_to conversation_messages_path(@conversation)
		end
	end

	private 

	def message_params
		params.require(:message).permit(:body,:user_id)
	end
end