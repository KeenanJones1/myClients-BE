class MyClientSerializer 
 def initialize(my_client_object, client_object)
  @my_client = my_client_object
  @client = client_object
 end

 def to_serialized_json
  {first_name: @client.first_name, last_name: @client.last_name, coolness_rating: @my_client.coolness_rating, visits: @my_client.visits, tipped: @my_client.tipped, likelihood_to_return: @my_client.likelihood_to_return, client_address: @client.address, email: @client.email, phone_number: @client.phone_number, gender: @client.gender, date_of_birth: @client.date_of_birth, soaps: @my_client.soaps, last_visted: @my_client.soaps.last.updated_at}
 end

end