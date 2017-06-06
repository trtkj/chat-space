class MessagesController < ApplicationController
  def index
    @message = Message.new
    # groupのidは仮置き
    @group = Group.find(1)
  end

  def create
    @message = Message.create(message_params)
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
