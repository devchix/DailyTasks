class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :confirmable, :lockable, :timeoutable, :activatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
   has_many :tasks
   def validate_on_create
        existing_address = WhitelistEntry.find_by_email(email)
        if existing_address 
        else
          message =  email+" not in whitelist, application is restricted to approved users during beta."
          errors.add("email ",message)
        end
   end
end
