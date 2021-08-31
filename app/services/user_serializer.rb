class UserSerializer 
 def initialize(user_object)
  @user = user_object
 end

 def to_serialized_json
  @user.to_json(:only => [:first_name, :last_name, :email, :license_number, :bio], :include => {:my_clients => {:only => [:coolness_rating, :visits, :created_at, :updated_at], :include => {:client => {:only => [:first_name, :last_name, :gender]}}}})
 end

 def serialize_my_client
  byebug
  @user.to_json(:include => {:my_clients => {:only => [:coolness_rating, :visits, :created_at, :updated_at], :include => {:client => {:only => [:first_name, :last_name, :gender]}}}})
 end


end