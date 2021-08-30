require "json_web_token.rb"

class Authorization
 def initialize(request)
   @token = request.headers[:Authorization].split(' ')[1]
 end

 def current_user
   JsonWebToken.decode(@token)[:user_id] if @token
 end
end