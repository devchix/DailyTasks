class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  
   has_many :tasks
   def validate
        valid_addresses = [ "somerset@gmail.com", "rebecca.gutterman@gmail.com", "mrnicksgirl@gmail.com", "beverly@beverlynelson.net"]
        if valid_addresses.include? email
        else
          message =  email+" not in whitelist, application is restricted to approved users during beta."
          errors.add("email ",message)
        end
   end
end
