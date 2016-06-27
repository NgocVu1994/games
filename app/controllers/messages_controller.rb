class MessagesController < ApplicationController
  load_and_authorize_resource

  def create
    if @message.save
      flash[:success] = flash_message "created"
    else
      flash[:failed] = flash_message "not_created"
    end
    redirect_to root_url
  end

  private
  def message_params
    params.require(:message).permit :name, :email, :message, :phone
  end
end
