class FeedbackController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationMailer.feedback_message(@message).deliver
      redirect_to(root_path, :notice => "Thank you for your feedback!")
    else
      flash.now.alert = "Please verify all fields"
      render :new
    end
  end

end
