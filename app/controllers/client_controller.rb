class ClientController < ApplicationController

 def create
  authorization_object = Authorization.new(request)
  current_user = authorization_object.current_user
  user = User.find(current_user)

  if !current_user || !user 
   render json: {message: "Please Log in"}, status: 401
  end

  client = Client.create(client_params)
  my_client = MyClient.create(user:user, client: client)
  my_client.update(my_client_params)
  render json: {message: "Client Saved", user: UserSerializer.new(user).to_serialized_json}, status: 201
 end

 def show
  authorization_object = Authorization.new(request)
  current_user = authorization_object.current_user
  user = User.find(current_user)
  client = Client.find(params['id'])

  if user == client.my_client.user && client
   render json: {client: client, my_client_ratings: client.my_client}, status: 201
  else
   render json: {message: 'Sorry not authorized to view client files'}, status: 401
  end
 end

 def update
  authorization_object = Authorization.new(request)
  current_user = authorization_object.current_user
  user = User.find(current_user)
  client = Client.find(params['id'])

  if user == client.my_client.user && client
   client.update(client_params)
   render json: {message: 'File successfully updated', user: UserSerializer.new(user).to_serialized_json}, status: 201
  else
   render json: {message: 'Sorry not authorized to view client files'}, status: 401
  end

 end

 def destroy
  authorization_object = Authorization.new(request)
  current_user = authorization_object.current_user
  user = User.find(current_user)
  client = Client.find(params['id'])

  if user == client.my_client.user && client
   my_client = client.my_client
   my_client.destroy
   client.destroy
   render json: {message: 'File successfully deleted', user: UserSerializer.new(user).to_serialized_json}, status: 201
  else
   render json: {message: 'Sorry not authorized to view client files'}, status: 401
  end
 end


 private 
 def client_params
   params.require(:client).permit(:email, :first_name, :last_name, :occupation, :gender, :date_of_birth, :address, :phone_number)
 end

 def my_client_params
  params.require(:my_client).permit(:coolness_rating, :tipped, :likelihood_to_return)
 end
end
