class SoapController < ApplicationController

 def create 
  authorization_object = Authorization.new(request)
  current_user = authorization_object.current_user
  user = User.find(current_user)
  my_client = MyClient.find(params["soap"]["my_client_id"])

  if my_client.user_id == user.id && user
   soap = Soap.create(soap_params)
   render json: MyClientSerializer.new(my_client, my_client.client).to_serialized_json, status: 201
  else
   render json: {message: "Unauthorized user"}, status: 401
  end
 end

 def index 
  authorization_object = Authorization.new(request)
  current_user = authorization_object.current_user
  user = User.find(current_user)
  my_client = MyClient.find(params["soap"]["my_client_id"])

  if my_client.user_id == user.id && user
   render json: {soaps: my_client.soaps}, status: 201
  else
   render json: {message: "Unauthorized user"}, status: 401
  end
 end


 def show 
  authorization_object = Authorization.new(request)
  current_user = authorization_object.current_user
  user = User.find(current_user)
  soap = Soap.find(params["id"])
  my_client = MyClient.find(params["soap"]["my_client_id"])

  if my_client.user_id == user.id && soap
   render json: {soap: soap}, status: 201
  else
   render json: {message: "Unauthorized user"}, status: 401
  end
 end

 def update 
  authorization_object = Authorization.new(request)
  current_user = authorization_object.current_user
  user = User.find(current_user)
  soap = Soap.find(params["id"])
  my_client = MyClient.find(params["soap"]["my_client_id"])

  if my_client.user_id == user.id && soap
   soap.update(soap_params)
   render json: {soap: soap}, status: 201
  else
   render json: {message: "Unauthorized user"}, status: 401
  end
 end

 def destroy 
  authorization_object = Authorization.new(request)
  current_user = authorization_object.current_user
  user = User.find(current_user)
  soap = Soap.find(params["id"])
  my_client = MyClient.find(params["soap"]["my_client_id"])

  if my_client.user_id == user.id && soap
   soap.destroy
   render json: {message: "Successfully Deleted SOAP note", my_client: MyClientSerializer.new(my_client, my_client.client).to_serialized_json}, status: 201
  else
   render json: {message: "Unauthorized user"}, status: 401
  end

 end

 private
 def soap_params
  params.require(:soap).permit(:my_client_id, :subject, :objective, :assessment, :plan)
 end

end
