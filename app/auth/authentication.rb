class Authentication
 def initialize(user_object)
   @license_number = user_object[:license_number]
   @password = user_object[:password]
   @user = User.find_by(license_number: @license_number)
 end

 def authenticate
   @user && @user.authenticate(@password)
 end
 
 def generate_token
   JsonWebToken.encode(user_id: @user.id)
 end
end