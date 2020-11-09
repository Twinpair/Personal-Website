require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "contact_message" do
    contact = contacts(:one)
    mail = ContactMailer.contact_message(contact)
    assert_equal "Contact message", mail.subject
    assert_equal ["ericgonzadev@gmail.com"], mail.to
    assert_equal ["message@eric-gonzalez.com"], mail.from
    assert_match "#{contact.message.encode}", mail.body.encoded
  end

end
