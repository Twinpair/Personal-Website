class ContactsController < ApplicationController
  before_action :authenticate, only: [:index, :destroy]
  
  def index
    @contacts = Contact.all
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_message(@contact).deliver_now
  		flash[:success] = "Messaged has been sent"
      redirect_to "/#contact"
    else
      @information = Information.first
      @slash = "/"
      render :new
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to contacts_url
  end

private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :captcha)
  end

end
