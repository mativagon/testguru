class ContactsMailer < ApplicationMailer
  def send_form(user:, message:)
    @user = user
    @message = message

    mail to: 'testguru114@gmail.com'
  end
end
