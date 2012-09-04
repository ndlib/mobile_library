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

      if @message.errors[:email].any?
        flash.now.alert = "Please ensure email is in proper format"
      else
        flash.now.alert = "Feedback is required"
      end

      render :new
    end
  end

end
