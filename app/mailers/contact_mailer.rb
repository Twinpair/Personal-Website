class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_message.subject
  #
  def contact_message(contact)
    @contact = contact

    mail to: "ericgonzadev@gmail.com"
  end
end
