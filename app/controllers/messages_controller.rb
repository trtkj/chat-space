class MessagesController < ApplicationController
  def index
    @message = Message.new
    # groupのidは仮置き
    @group = Group.find(1)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to :root
    else
      redirect_to :root, alert: "メッセージを入力してください"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
