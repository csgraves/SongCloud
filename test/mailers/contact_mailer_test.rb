require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  #Test successful contact
  test "should return contact email" do
    mail = ContactMailer.contact_email("conor@com2025.com", "Conor Graves", "1234567890", @message = "Hello")
  assert_equal ['conor@courseworkapp.com'], mail.to
  assert_equal ['conor@courseworkapp.com'], mail.from
  end



end
