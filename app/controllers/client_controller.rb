class ClientController < ApplicationController

 def create
  byebug
 end

 def show
  authorization_object = Authorization.new(request)
  current_user = authorization_object.current_user
  user = User.find(current_user)
  client = Client.find(params['id'])
  if user == client.my_client.user && client
   # serialize
   render json: {client: client, my_client_ratings: client.my_client}, status: 201
  else
   render json: {message: 'Sorry not authorized to view client files'}, status: 401
  end

 end
end
