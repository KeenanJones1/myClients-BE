class MyClientController < ApplicationController


 def show
  authorization_object = Authorization.new(request)
  current_user = authorization_object.current_user
  user = User.find(current_user)
  my_client = MyClient.find(params['id'])
  client = Client.find(my_client.client_id)

  if user && user.id == my_client.user_id
   render json: {client: MyClientSerializer.new(my_client, client).to_serialized_json}, status: 201
  else
   render json: {message: 'UnAuthorized User'}, 401
  end
 end 

 def update
  byebug
  authorization_object = Authorization.new(request)
  current_user = authorization_object.current_user
  user = User.find(current_user)
  my_client = MyClient.find(params['id'])
  
  if user && user.id == my_client.user_id
   client = Client.find(my_client.client_id)
   my_client.update(my_client_params)
   client.update(client_params)
   render json: {client: MyClientSerializer.new(my_client, client).to_serialized_json}, status: 201
  else
   render json: {message: 'UnAuthorized User'}, 401
  end
 end

 
 private 
 def client_params
   params.require(:client).permit(:email, :first_name, :last_name, :occupation, :gender, :date_of_birth, :address, :phone_number)
 end

 def my_client_params
  params.require(:my_client).permit(:coolness_rating, :tipped, :likelihood_to_return, :visits)
 end
end
