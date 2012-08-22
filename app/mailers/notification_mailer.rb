class NotificationMailer < ActionMailer::Base
  default :from => "noreply@nd.edu"
  default :to => "rmalott@nd.edu"

  def feedback_message(message)
    @message = message
    mail(:subject => "Mobile Website Feedback")
  end


end
