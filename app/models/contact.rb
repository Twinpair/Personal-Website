class Contact < ActiveRecord::Base
	#Validations form is not empty
  validates_presence_of :name, :message => "cant be blank"
  validates_presence_of :email,  :message => "cant be blank"
  validates_presence_of :message,  :message => "cant be blank"
  VALID_CAPTCHA_REGEX = /\Aczarface\z/i
  validates :captcha, presence: true, format: {with: VALID_CAPTCHA_REGEX, message: "text did not match image text"}
end
