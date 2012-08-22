class FeedbackController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.feedback_message(@message).deliver
      redirect_to(root_path, :notice => "Thank you for submitting feedback!")
    else
      flash.now.alert = "Please verify all fields are filled in."
      render :new
    end
  end

end
